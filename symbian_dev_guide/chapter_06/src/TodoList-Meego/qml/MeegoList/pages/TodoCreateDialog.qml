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
import "../delegates"
import "../js/UIConstants.js" as Ui

QueryDialog  {
    id: root

    property int boxId : 0
    property alias todoTitle: titleField.text;

    acceptButtonText: "Ok"
    rejectButtonText: "Cancel"

    titleText: "Add New Todo"

    content: Column {
        id: column
        spacing: 5
        anchors.left: parent.left; anchors.right: parent.right

        Text {
            id: titleLabel
            text:  "Title"
            font.pixelSize: Ui.FONT_LARGE
            color: Ui.COLOR_BACKGROUND
            anchors.margins: 5
        }

        TextField{
            id: titleField
            font.pixelSize: Ui.FONT_DEFAULT
            placeholderText: "Enter todo title..."
            anchors{
                right: parent.right; left: parent.left
                margins: 5
            }
        }

        Text {
            id : boxLabel;
            text:  "Select Box"
            font.pixelSize: Ui.FONT_LARGE
            color: Ui.COLOR_BACKGROUND
            anchors.margins: 5
        }

        TextField {
            id: itemSelection
            text: selectionDialog.model.get(boxId).name
            readOnly: true
            anchors{
                right: parent.right; left: parent.left
                margins: 5
            }

            BoxSelectionDialog {
                id: selectionDialog

                onAccepted :{
                    itemSelection.text = model.get(selectedIndex).name;
                    boxId = model.get(selectedIndex).boxId;
                }
            }

            MouseArea{
                anchors.fill: parent;
                onClicked: selectionDialog.open();
            }
        }
    }

    onStatusChanged: {
        if (status == DialogStatus.Opening) {
            todoTitle = "";
        }
    }

}
