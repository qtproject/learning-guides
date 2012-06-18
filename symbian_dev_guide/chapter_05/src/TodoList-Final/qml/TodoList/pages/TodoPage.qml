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

import QtQuick 1.0
import com.nokia.symbian 1.1
import "../js/core.js" as Core
import "../delegates"

Page {
    id: root

    property int todoId: 1


    TitleHeader {
        id: header
        text: "Todo Details"
    }

    Label {
        id: titleLabel
        text: "Title:"
        color: platformStyle.colorNormalLight
        font.family: platformStyle.fontFamilyRegular
        anchors {
            top: header.bottom;
            left: root.left; right: root.right
            margins: 5
        }
    }

    CheckBox {
        id: doneField
        anchors {
            top: titleLabel.bottom
            left: root.left
        }
    }

    TextField {
        id: titleField
        readOnly: true
        anchors {
            top: doneField.top;
            left: doneField.right; right: root.right
        }
    }

    Label {
        id: noteLabel
        text: "Note:"
        color: platformStyle.colorNormalLight
        font.family: platformStyle.fontFamilyRegular
        anchors {
            top: doneField.bottom
            left: root.left; right: root.right
            margins: 5
        }
    }

    TextArea {
        id: noteField
        anchors {
            top: noteLabel.bottom; bottom: root.bottom
            left: root.left; right: root.right
        }
        readOnly: true
    }

    tools: ToolBarLayout {

        ToolButton {iconSource: "toolbar-back"; onClicked:{update();root.pageStack.pop()} visible: root.state=="details"}

        ButtonRow {
            exclusive: false
            Button { id: editTool; text: "Edit"; onClicked: root.state = "edit"}
            Button { id: doneTool; text: "Done"; onClicked: root.state= "details"}
            Button { id: moveTool; text: "Move To"; onClicked: moveToDialog.open()}
        }

        ToolButton { id: deleteTool; iconSource: "toolbar-delete";
            onClicked: {deleteItem(); root.pageStack.pop();}}

    }

    states:    [

        State {
            name: "details"
            PropertyChanges { target: titleLabel; height: 0; opacity: 0.0 }
            PropertyChanges { target: noteLabel; height: 0; opacity: 0.0 }
            PropertyChanges { target: doneTool; visible: false }
        },
        State {
            name: "edit"
            PropertyChanges { target: doneField; width: 0}
            PropertyChanges { target: noteField; readOnly: false }
            PropertyChanges { target: titleField; readOnly: false }
            PropertyChanges { target: editTool; visible: false }
            PropertyChanges { target: doneTool; visible: true }
            PropertyChanges { target: moveTool; visible: false }
            PropertyChanges { target: deleteTool; visible: false }

        }
    ]

    transitions: [
        Transition {
            NumberAnimation {properties: "width,height"; duration: 250}
        }
    ]


    onStatusChanged: {
        var item;
        if (status == PageStatus.Activating) {
            item = Core.readTodoItem(todoId);
            doneField.checked = item.done;
            titleField.text = item.title;
            noteField.text = item.note;

        }
        else if (status == PageStatus.Deactivating)
        {
            item = Core.readTodoItem(todoId);
            item.done = doneField.checked;
            Core.updateTodo(item);
        }
    }

    function update()
    {
        var item = Core.readTodoItem(todoId);
        item.title = titleField.text;
        item.note = noteField.text;
        item.modified = new Date();
        Core.updateTodo(item);
    }

    function deleteItem()
    {
        Core.deleteTodo(todoId);
    }

    BoxSelectionDialog {
        id: moveToDialog

        onAccepted:{
            var box = model.get(selectedIndex).boxId;
            print(box, selectedIndex);
            var item = Core.readTodoItem(todoId);
            item.box = box;
            Core.updateTodo(item);
            root.pageStack.pop();
        }
    }
}
