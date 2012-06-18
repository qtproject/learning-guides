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

    ListModel {
        id: boxModel
        ListElement { name: "Inbox"; boxId: 0; count: 0 }
        ListElement { name: "Today"; boxId: 1; count: 0 }
        ListElement { name: "Next";  boxId: 2; count: 0 }
        ListElement { name: "Later"; boxId: 3; count: 0 }
    }

    TitleHeader {
        id: header;
        text: "Todo List"
    }

    ListView {
        id:  boxView
        anchors {
            left: root.left; right: root.right;
            top: header.bottom; bottom: parent.bottom;
        }
        model: boxModel
        delegate: BoxItemDelegate {
            id: itemDelegate
            title: model.name +" (" + model.count +")"
            onClicked: {
                root.pageStack.push(window.boxPage, {boxId: model.boxId, title: model.name});
            }
        }
        clip: true
    }

    TodoCreateDialog {
        id: todoCreateDialog

        onAccepted: {
            if (todoTitle !== "") {
                var item = Core.defaultItem();
                item.box = boxId;
                item.title = todoTitle;
                Core.createTodo(item);
                updateUi();
            }
        }
    }

    tools: ToolBarLayout {
        id: pageSpecificTools

        ToolButton {
            iconSource: "toolbar-back"
            onClicked:  Qt.quit()}

        ToolButton {
            iconSource: "toolbar-add";
            onClicked: todoCreateDialog.open() }

        ToolButton {
            iconSource: "toolbar-delete"
            onClicked: root.pageStack.push(Qt.resolvedUrl("ArchivePage.qml"))
        }

        ToolButton {
            iconSource: "toolbar-settings";
            onClicked: root.pageStack.push(Qt.resolvedUrl("ToolPage.qml"))
        }
    }

    onStatusChanged:{
        if (status == PageStatus.Activating) {
            updateUi();
        }
    }

    function updateUi()
    {
        for (var i=0; i< boxModel.count; i++)
        {
            var boxId= boxModel.get(i).boxId;
            boxModel.set(i, {count: Core.countBox(boxId)});
        }
    }

}
