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

// MarkerPanel.qml

Item {
    id: root
    width: 150; height: 450

    // a property of type string to hold the value of the current active marker
    property string activeMarker: "personal"

    // a list for holding respective data for a Marker item.
    property variant markerData: [
        { img: "images/personalmarker.png", markerid: "personal" },
        { img: "images/funmarker.png", markerid: "fun" },
        { img: "images/workmarker.png", markerid: "work" }
    ]

    Column {
        id: layout
        anchors.fill: parent
        spacing: 5
        property int activeMarker

        Repeater {
            // using the defined list as our model
            model: markerData
            delegate:
                Marker {
                id: marker

                // the active property of the Marker is true only when the marker
                // item is the one current active one set on the onClicked signal
                active: layout.activeMarker == index

                source: modelData.img

                // handling the clicked signal of the Marker item, setting the currentMarker property
                // of MarkerPanel based on the clicked Marker
                onClicked: {
                    layout.activeMarker = index
                    root.activeMarker = modelData.markerid
                }
            }
        }
    }
}
