/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.1

import "../utils" 1.0
import "../components" 1.0
import "../js/style.js" as Style
import "../js/logic.js" as Logic

Rectangle {
    id: root
    property string defaultLocation: configure.locationText
    property int defaultInterval: configure.forecastUpdateInterval
    property bool showSeconds: configure.showSeconds
    property bool showDate: configure.showDate
    property bool forceOffline: configure.forceOffline
    state: forceOffline ? "Offline" : weatherModelItem.state

    width: 360
    height: 640

    onStateChanged: {
        if (state == "Offline")
            statusText.showStatus ("offline");
        else if (state == "Loading")
            statusText.showStatus ("loading...");
        else if (state == "Live Weather")
            statusText.showStatus ("live weather");
    }

    Image {
        id: background
        source: Style.backgroundImage
        fillMode: "Tile"
        anchors.fill: parent
        onStatusChanged: if (background.status == Image.Error)
                                console.log("Background image \"" +
                                            source +
                                            "\" cannot be loaded")
    }

    Dialog {
        id: errorDialog
        width: root.width
        anchors.centerIn: parent
        z: root.z+1
        visible: false
    }

    WeatherModelItem {
        id: weatherModelItem
        location: root.defaultLocation
        interval: root.defaultInterval
        forceOffline: root.forceOffline

        onModelDataErrorChanged: {
            if (weatherModelItem.modelDataError)
                errorDialog.show(weatherModelItem.statusMessage)
        }
    }

    Component {
        id: weatherCurrentDelegate
        Weather {
            id: currentWeatherItem
            labelText: root.defaultLocation
            conditionText: model.condition
            tempText: model.temp_c + "C°"
        }
    }

    Component {
        id: weatherForecastDelegate
        Weather {
            id: forecastWeatherItem
            labelText: model.day_of_week
            conditionText: model.condition
            tempText: Logic.f2C (model.high) +
                      "C° / " +
                      Logic.f2C (model.low) +
                      "C°"
        }
    }

    NightClock {
        id: clockScreen
        height: 130
        anchors.centerIn: root
        showDate: root.showDate
        showSeconds: root.showSeconds
        textColor: Style.offlineClockTextColor
    }

    Flow {
        id: weatherScreen
        width: root.width
        height: root.height
        anchors.fill: parent
        anchors.margins: Style.baseMargin
        spacing: 30

        NightClock {
            id: clock
            height: 80
            width: 190
            showDate: root.showDate
            showSeconds: root.showSeconds
            textColor: Style.onlineClockTextColor
        }

        ListView {
            id: currentWeatherView
            width: 100
            height: 100
            model: weatherModelItem.currentModel
            delegate: weatherCurrentDelegate
            interactive: false
        }

        Repeater {
            id: forecastWeatherView
            model: weatherModelItem.forecastModel
            delegate: weatherForecastDelegate
        }

        move: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 500
                easing.type: Easing.OutBounce
            }
        }
    }

    Text {
        id: statusText
        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottom: exitButton.top
        anchors.margins: Style.baseMargin
        color: Qt.lighter(Style.penColor)
        font.pixelSize: Style.textPixelSize*0.8
        text: qsTr("Status: starting...")

        function showStatus (newStatusText) {
            text = qsTr("Status: " + newStatusText);
        }
    }

    // it is off and invisible by default
    BusyIndicator {
        id: busyIndicator
        anchors.horizontalCenter: root.horizontalCenter
        anchors.bottom: statusText.top
        anchors.margins: Style.baseMargin
    }

    Button {
        id: configureButton
        text: qsTr("Config")
        anchors.left: root.left
        anchors.bottom: root.bottom
        anchors.margins: Style.baseMargin
        onClicked: {
            configure.visible = true;
        }

    }

    Button {
        id: exitButton
        text: qsTr("Exit")
        width: configureButton.width
        anchors.right: root.right
        anchors.bottom: root.bottom
        anchors.margins: Style.baseMargin
        onClicked: Qt.quit()
    }

    Button {
        id: toggleStatesButton
        anchors.right: exitButton.left
        anchors.left: configureButton.right
        anchors.bottom: root.bottom
        anchors.margins: Style.baseMargin
        // simple binding like this "text: root.state" works here to, but it is more diifcult to translate then.
        // we use explicit strngs instead
        text: root.state == "Offline" ? qsTr("Get weather") : qsTr("Go offline")
        onClicked: {
            if (root.state == "Offline")
                configure.forceOffline = false;
            else
                configure.forceOffline = true;
        }
        // for experimental purposes...
        // onPressedAtXY: {
        //     console.log ("pressed at: " + coordinates)
        // }
    }

    Configure {
        id: configure
        anchors.fill: root
        z: root.z + 1
        visible: false
        showSeconds: true
        showDate: true
        forecastUpdateInterval: 5
        locationText: qsTr("Munich")
        forceOffline: false
    }

    states: [
        State {
            name: "Offline"
            PropertyChanges {target: clockScreen; visible: true}
            PropertyChanges {target: weatherScreen; visible: false}
        },
        State {
            name: "Live Weather"
            PropertyChanges {target: clockScreen; visible: false}
            PropertyChanges {target: weatherScreen; visible: true}
        },
        State {
            name: "Loading"
            PropertyChanges {target: clockScreen; visible: true}
            PropertyChanges {target: weatherScreen; visible: false}
            PropertyChanges {target: busyIndicator; on: true}
        }
    ]

    transitions: [
        Transition {
            from: "Offline"
            to: "Live Weather"
            PropertyAnimation {
                target: weatherScreen
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.Linear
                duration: 5000
            }
        },
        Transition {
            from: "Live Weather"
            to: "Offline"
            PropertyAnimation {
                target: clockScreen
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.Linear
                duration: 5000
            }
        }
    ]
}
