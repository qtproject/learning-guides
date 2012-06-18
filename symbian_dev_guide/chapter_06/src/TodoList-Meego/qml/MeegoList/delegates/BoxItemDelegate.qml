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
import com.nokia.meego 1.0
import "../js/UIConstants.js" as Ui


Item {
    id: root

    property alias text: textField.text
    property alias iconSource: icon.source
    property alias description: descriptionField.text

    signal clicked

    height: 100
    anchors.left: parent.left
    anchors.right: parent.right

    Rectangle {
        // Will be used to add an animation once the delegate is being clicked
        id : background
        anchors.fill: parent
        color: Ui.COLOR_SELECT
        opacity: 0.0
    }

    Row {
        id: row
        anchors.fill: parent
        spacing: 10

        BorderImage {
            id: icon
            anchors.verticalCenter: parent.verticalCenter
            height: 30
            width: 30

        }

        Column {
            id: column
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: textField
                color: Ui.COLOR_FOREGROUND
                font.pixelSize: Ui.FONT_LARGE
            }

            Text {
                id: descriptionField
                font.pixelSize: Ui.FONT_SMALL

            }

        }
    }


    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked();
            // Start a short animation by changing the background opacity once the delegate is being clicked
            clickAnimation.start();
        }

    }

    SequentialAnimation {
        id: clickAnimation
        PropertyAnimation{target: background; properties:"opacity";to: 1.0; duration:75}
        PropertyAnimation{target: background; properties:"opacity";to: 0.0; duration:75}

    }

}
