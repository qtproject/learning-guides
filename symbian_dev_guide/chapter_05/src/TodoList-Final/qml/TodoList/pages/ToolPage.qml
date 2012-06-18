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
        id: caseModel

        ListElement { title: "Reset Table";           name : "resetTable"  }
        ListElement { title: "10 Todo Item";          name: "createTodos10" }
        ListElement { title: "100 Random Todo Item";  name: "createTodos100" }
        ListElement { title: "1000 Random Todo Item"; name: "createTodos1000" }
    }

    function runTest(testName)
    {
        print("run test " + testName)
        switch (testName){
        case "resetTable" :
            Core.dropTable();
            Core.createTable();
            break;
        case "createTodos10" :
            createTodos(10);
            break;
        case "createTodos100" :
            createTodosRandomBox(100);
            break;
        case "createTodos1000" :
            createTodosRandomBox(1000);
            break;
        }
    }

    function createTodos(count)
    {
        var data = [];
        for (var i=0; i< count; i++){
            data[i] = {
                box: 0,
                done: false,
                title: "Todo_"+i+1,
                note: "No Note",
                modified: new Date()
            }
        }
        Core.createBatchTodos(data);
    }

    function createTodosRandomBox(count)
    {
        var data = []
        for (var i=0; i< count; i++){
            data[i] = {
                box: Math.floor(Math.random()*5),
                done: i%2?true:false,
                title: "Todo"+i+1,
                note: "No Note",
                modified: new Date()
            }
        }
        Core.createBatchTodos(data);
    }

    TitleHeader {
        id: header
        text: "Tool Page"
    }

    ListView {
        id: view
        anchors {
            left: root.left; right:  root.right;
            top: header.bottom; bottom: parent.bottom
        }
        clip: true
        model: caseModel
        delegate: BoxItemDelegate {
            id: itemDelegate
            title: model.title
            subItemIndicator: false
            onClicked : runTest(model.name);
        }
    }

    tools: ToolBarLayout {
        ToolButton {iconSource: "toolbar-back"; onClicked: root.pageStack.pop();}
    }

}
