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

import "../components" 1.0
import "../js/logic.js" as Logic
import "../js/style.js" as Style

Rectangle {
    id: root
    property string defaultLocation: "Munich"
    property int defaultInterval: 60 // in seconds
    property bool showSeconds: true
    property bool showDate: true

    width: 360
    height: 640

    Image {
        id: background
        source: "../content/resources/background.png"
        fillMode: "Tile"
        anchors.fill: parent
        onStatusChanged: if (background.status == Image.Error)
                             console.log("Background image \"" +
                                         source +
                                         "\" cannot be loaded")
    }

    WeatherModelItem {
        id: weatherModelItem
        location: root.defaultLocation
        interval: root.defaultInterval
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

    Column {
        id: clockAndWeatherScreen
        anchors.centerIn: root

        NightClock {
            id: clock
            height: 80
            width: 160
            showDate: root.showDate
            showSeconds: root.showSeconds
            textColor: Style.onlineClockTextColor
        }

        Repeater {
            id: currentWeatherView
            model: weatherModelItem.currentModel
            delegate: weatherCurrentDelegate
        }

        GridView {
            id: forecastWeatherView
            width: 300
            height: 300
            cellWidth: 150; cellHeight: 150
            model: weatherModelItem.forecastModel
            delegate: weatherForecastDelegate
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
