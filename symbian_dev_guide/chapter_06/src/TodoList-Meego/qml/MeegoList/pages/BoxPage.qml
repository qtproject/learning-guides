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

Page {
    id: root

    property int boxId:  0
    property string title

    ListModel {
        id: itemModel
    }

    TitleHeader {
        id: header
        text: root.title
    }

    ListView {
        id: view
        anchors {
            left: root.left; right:  root.right;
            top: header.bottom; bottom: parent.bottom
        }
        model: itemModel
        clip: true
        delegate: TodoItemDelegate {
            title: model.title
            checked: model.done
            note: model.note
            onClicked: {
                root.pageStack.push(window.todoPage, {todoId:model.id});
            }
            onCheckBoxClicked: {
                if (checked != model.done) {
                    itemModel.setProperty(index, 'done', checked);
                    Core.updateTodo(model);
                }
            }
        }


    }

    // TodoCreateDialog to add new todo to the current box
    TodoCreateDialog {
        id: todoCreateDialog
        boxId: root.boxId

        onAccepted: {
            var item = Core.defaultItem();
            item.box = boxId;
            item.title = todoTitle;
            Core.createTodo(item);
            updateUi();
        }
    }

    tools: ToolBarLayout {
        ToolIcon { iconId: "icon-m-toolbar-back"; onClicked: pageStack.pop() }
        ToolIcon { iconId: "icon-m-toolbar-add"; onClicked: todoCreateDialog.open() }
        ToolIcon { iconId: "icon-m-toolbar-delete";onClicked:{Core.updateArchive(root.boxId); updateUi()}

        }
    }

    onStatusChanged: {
        if (status == PageStatus.Activating) {
            updateUi();
        }
    }

    function updateUi() {
        view.model = 0;
        Core.readTodoBox(itemModel, boxId);
        view.model = itemModel;
    }

}
