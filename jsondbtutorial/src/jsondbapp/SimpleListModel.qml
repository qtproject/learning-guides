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

import QtQuick 2.0
import QtJsonDb 1.0 as JsonDb

Item {
    id: root
    width: 300
    height: 400

    //creating the partition object that will be
    //used to create work with with json objects
    JsonDb.Partition {
        id: myPartition
    }

    //a list-model that operates on a JsonDb partion
    //for retrieving json objects
    JsonDb.JsonDbListModel {
        id: contacts
        query: '[?_type="Contact"]'
        roleNames: ["fullName", "age", "_uuid"]
        partition: myPartition
        limit: 40
    }

    JsonDb.Notification {
        partition: myPartition
        query: '[?_type="Contact"]'
        onNotification: {
            switch (action) {
            case JsonDb.Notification.Create :
                console.log("{_uuid :" + result._uuid + "} created");
                break;
            case JsonDb.Notification.Update :
                console.log("{_uuid :" + result._uuid + "} was updated");
                break;
            case JsonDb.Notification.Remove :
                console.log("{_uuid :" + result._uuid + "} was removed");
                break;
            }
        }
    }

    Button {
        id: buttonAdd
        anchors.top: parent.top
        width: parent.width/4
        text: "Add contact"

        //adding random string values as part of the json object
        onClicked: {
            //an array of random names
            var fullnames = ["Malcolm Reinolds", "Zoe Washburn", "Hoban Serra", "Inara Cobb", "Jayne Frye", "Kaylee Tam", "Simon Perres", "River Cry", "Shepard Frank", "Frank Sinatra"]
            var ages = ["45", "32", "38","65","19", "54", "78", "61", "27", "56", "38", "42", "31", "23"]
            function rand(n) { return Math.floor(Math.random() * n); }

            //randomly picking up values from the arrays
            var fullname = fullnames[rand(fullnames.length)]
            var age = ages[rand(ages.length)]

            //create a contact
            myPartition.create({"_type":"Contact", "fullName":fullname, "age":age }, createCallback)
        }
    }

    Button {
        id: buttonDelete
        anchors.top: parent.top
        anchors.left: buttonAdd.right
        width: parent.width/4
        text: "Delete contact"

        onClicked: {
            myPartition.remove({"_uuid": contacts.get(listView.currentIndex, "_uuid")}, removeCallback)
            console.log("Removed Item : " + contacts.get(listView.currentIndex, "_uuid"))
        }
    }

    Button {
        id: sortButtonName
        anchors.top: parent.top
        anchors.left: buttonDelete.right
        width: parent.width/4
        text: "Sort Name"

        onClicked: {
            contacts.query = ("[?_type=\"Contact\"][/fullName]")
        }
    }

    Button {
        id: sortButtonAge
        anchors.top: parent.top
        anchors.left: sortButtonName.right
        anchors.right: parent.right
        text: "Sort Age"

        onClicked: {
            contacts.query = ("[?_type=\"Contact\"][/age]")
        }
    }

    //listview that displays the JsonDbListModel
    ListView {
        id: listView
        anchors.top: buttonAdd.bottom
        anchors.bottom: statusText.top
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        width: parent.width
        model: contacts
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 ;width: 200;}
        focus: true
        delegate: Row {
            spacing: 10
            TextEdit {
                id: textedit
                text: model.fullName
                onFocusChanged: {
                    var contact = {}
                    contact['_uuid'] = contacts.get(index, "_uuid")
                    contact['_type'] = "Contact"
                    contact['fullName'] = textedit.text
                    myPartition.update(contact,  updateCallback)
                }

                MouseArea {
                    anchors.fill: parent;
                    //set the currentIndex property with index
                    //of the pressed item
                    onPressed: {
                        listView.currentIndex = index;
                        textedit.focus = true
                    }
                }
            }

            Text {
                id: agelbl
                text: model.age
            }
        }
    }

    Rectangle {
        id: statusText
        anchors.bottom: parent.bottom
        width: parent.width
        height: 20
        color:  "lightgray"
        Text {
            anchors.centerIn: parent
            text: "limit : " + contacts.limit + "  rowCount : " + contacts.rowCount + "  state : " + contacts.state
        }
    }


    function createCallback(error, response) {
        if (error) {
            // communication error or failed to create one or more objects.
            // 'error' object is only defined in case of an error otherwise undefined.
            console.log("Create Error :"+JSON.stringify(error));
        }
    }

    function removeCallback(error, response) {
        if (error) {
            // communication error or failed to create one or more objects.
            // 'error' object is only defined in case of an error otherwise undefined.
            console.log("Remove Error :"+JSON.stringify(error));
        }
    }

    function updateCallback(error, response) {
        if (error) {
            // communication error or failed to create one or more objects.
            // 'error' object is only defined in case of an error otherwise undefined.
            console.log("Update Error :"+JSON.stringify(error));
        }
    }
}


