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
import "../js/core.js" as Core
import "../delegates"
import "../js/UIConstants.js" as Ui

Page {
    id: root

    property int todoId

    TitleHeader {
        id: header
        text: "Todo Details"
    }

    Label {
        id: titleLabel
        text: "Title"
        anchors {
            top: header.bottom
            left: root.left; right: root.right
            margins: 5
        }
    }

    TextField {
        id: titleField
        readOnly: true
        anchors {
            top: titleLabel.bottom
            left: root.left; right: doneField.left
            margins: 5
        }

    }

    Switch {
        id: doneField
        anchors {
            top: titleField.top
            right: root.right
            margins: 5
        }
    }


    Label {
        id: noteLabel
        text: "Note "
        anchors {
            top: titleField.bottom
            left: root.left; right: root.right
            margins: 5
        }

    }

    TextArea {
        id: noteField
        height: 80
        anchors {
            top: noteLabel.bottom;
            left: root.left; right: root.right
            bottom: root.bottom
            margins: 5
        }
        readOnly: true
    }


    onStatusChanged: {
        var item
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

    function deleteItem()
    {
        Core.deleteTodo(todoId);
    }

    function update()
    {
        var item = Core.readTodoItem(todoId);
        item.title = titleField.text;
        item.note = noteField.text;
        item.modified = new Date();
        Core.updateTodo(item);
    }


    tools: ToolBarLayout {

        ToolIcon { iconId: "icon-m-toolbar-back"; onClicked:{update();root.pageStack.pop()}}
        ToolIcon { iconId: "icon-m-toolbar-view-menu"; onClicked: todoMenu.open()}
    }

    BoxSelectionDialog {
        id: moveToDialog;

        onAccepted:{
            var box = model.get(selectedIndex).boxId;
            print(box, selectedIndex);
            var item = Core.readTodoItem(todoId);
            item.box = box;
            Core.updateTodo(item);
            root.pageStack.pop();

        }
    }

    Menu {
        id: todoMenu
        // visualParent is needed to specify the grayed out area
        visualParent: pageStack
        MenuLayout {
            MenuItem {text: "Edit Details"; onClicked: root.performAction(0) }
            MenuItem {text: "Move to Another Box"; onClicked: root.performAction(1)}
            MenuItem {text: "Remove"; onClicked: root.performAction(2)}
        }

    }


    function performAction(actionId)
    {
        switch (actionId)
        {
        case 0:
            editSheet.open();
            break;
        case 1:
            moveToDialog.open();
            break;
        case 2:
            deleteItem();
            root.pageStack.pop();
            break;
        default:
            break;

        }

    }


    EditSheet
    {
        id: editSheet

        titleText: titleField.text
        noteText: noteField.text

        onAccepted: {
            titleField.text = titleText;
            noteField.text = noteText;
        }

        onRejected: {
            titleText = titleField.text;
            noteText = noteField.text;
        }
    }

}

