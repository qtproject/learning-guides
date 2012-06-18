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
import "../js/style.js" as Style

Rectangle {
    id: root
    property bool showSeconds: true
    property bool showDate: true
    property int forecastUpdateInterval: 5 // minutes
    property string locationText: "Munich"
    property bool forceOffline: false

    width: 320
    height: 480

    Image {
        id: background
        source: Style.backgroundImage
        fillMode: "Tile"
        anchors.fill: parent
    }

    Grid {
        id: controlElements
        spacing: 10
        columns: 2
        anchors.left: root.left
        anchors.leftMargin: spacing
        anchors.verticalCenter: root.verticalCenter
        anchors.right: root.right

        Text {
            id: locationLabel
            text: qsTr("Forecast for:<br>(city name)")
            color: locationTextInput.focus?
                       Qt.lighter(Style.penColor) : Style.penColor
            font.pixelSize: Style.textPixelSize
        }

        TextInput {
            id: locationTextInput
            width: controlElements.width - locationTextInput.x - controlElements.spacing
            text: locationText
            font.pixelSize: Style.textPixelSize
            color: Style.penColor
            focus: true
            KeyNavigation.up: offlineCheckBox
            KeyNavigation.down: updateTextInput
        }

        Text {
            id: updateLabel
            height: 90
            text: qsTr("update interval: <br>(in min)")
            color: updateTextInput.focus?
                       Qt.lighter(Style.penColor) : Style.penColor
            font.pixelSize: Style.textPixelSize
        }

        TextInput {
            id: updateTextInput
            width: locationTextInput.width
            text: forecastUpdateInterval
            font.pixelSize: Style.textPixelSize
            color: Style.penColor
            maximumLength: 3
            // we use IntValidator just to filter the input
            // onAccepted is not used here
            validator: IntValidator{bottom: 1; top: 999;}
            KeyNavigation.up: locationTextInput
            KeyNavigation.down: secondsCheckBox
        }

        Text {
            id: secondsLabel
            text: qsTr("Show seconds:")
            color: secondsCheckBox.focus?
                       Qt.lighter(Style.penColor) : Style.penColor
            font.pixelSize: Style.textPixelSize
        }

        CheckBox {
            id: secondsCheckBox
            checked: showSeconds
            KeyNavigation.up: updateTextInput
            KeyNavigation.down: dateCheckBox
        }

        Text {
            id: dateLabel
            text: qsTr("Show date:")
            color: dateCheckBox.focus?
                       Qt.lighter(Style.penColor) : Style.penColor
            font.pixelSize: Style.textPixelSize
        }

        CheckBox {
            id: dateCheckBox
            checked: showDate
            KeyNavigation.up: secondsCheckBox
            KeyNavigation.down: offlineCheckBox
        }

        Text {
            id: offlineLabel
            text: qsTr("Clock only")
            color: offlineCheckBox.focus?
                       Qt.lighter(Style.penColor) : Style.penColor
            font.pixelSize: Style.textPixelSize
        }

        CheckBox {
            id: offlineCheckBox
            checked: forceOffline
            KeyNavigation.up: secondsCheckBox
            KeyNavigation.down: locationTextInput
        }
    }

    Dialog {
        id: errorDialog
        width: root.width
        anchors.centerIn: parent
        z: root.z+1
        visible: false
    }

    Button {
        id: exitButton
        text: qsTr("OK")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        onClicked: {
            // update interval and location cannot be empty
            // update interval cannot be zero
            if (updateTextInput.text == "" || updateTextInput.text == 0)
                errorDialog.show (qsTr("The update interval cannot be empty"))
            else if (locationTextInput.text == "")
                errorDialog.show (qsTr("The location cannot be empty"))
            else {
                forecastUpdateInterval = updateTextInput.text
                root.locationText = locationTextInput.text
                root.visible = false
            }
            // update check box relevant settings
            root.showSeconds = secondsCheckBox.checked
            root.showDate = dateCheckBox.checked
            root.forceOffline = offlineCheckBox.checked
        }
    }
}
