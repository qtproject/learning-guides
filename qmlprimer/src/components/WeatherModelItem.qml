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

Item {
    id: root
    property alias forecastModel: forecast
    property alias currentModel: current
    property string location: "Munich"
    property bool forceOffline: false
    property string baseURL: "http://www.google.com"
    property string dataURL: "/ig/api?weather="
    property string source: baseURL + dataURL + location.split(' ').join('%20')
    property int interval: 5
    property bool modelDataError: false
    property string statusMessage: ""

    XmlListModel {
        id: forecast
        source: root.source
        query: "/xml_api_reply/weather/forecast_conditions"

        XmlRole { name: "day_of_week"; query: "day_of_week/@data/string()" }
        XmlRole { name: "low"; query: "low/@data/string()" }
        XmlRole { name: "high"; query: "high/@data/string()" }
        XmlRole { name: "condition"; query: "condition/@data/string()" }
        XmlRole { name: "temp_c"; query: "temp_c/@data/string()" }

        onStatusChanged: {
            root.modelDataError = false
            if (status == XmlListModel.Error) {
                root.state = "Offline"
                root.statusMessage = "Error occurred: " + errorString()
                root.modelDataError = true
                //console.log("Weather Clock: " + root.statusMessage)
            } else if (status == XmlListModel.Ready) {
                // check if the loaded model is not empty, and post a message
                if (get(0) === undefined) {
                    root.state = "Offline"
                    root.statusMessage = "Invalid location \"" + root.location + "\""
                    root.modelDataError = true
                } else {
                    root.state = "Live Weather"
                    root.statusMessage = "Live current weather is available"
                }
                //console.log("Weather Clock: " + root.statusMessage)
            } else if (status == XmlListModel.Loading) {
                root.state = "Loading"
                root.statusMessage = "Forecast data is loading..."
                //console.log("Weather Clock: " + root.statusMessage)
            } else if (status == XmlListModel.Null) {
                root.state = "Loading"
                root.statusMessage = "Forecast data is empty..."
                //console.log("Weather Clock: " + root.statusMessage)
            } else {
                root.modelDataError = false
                console.log("Weather Clock: unknown XmlListModel status:" + status)
            }
        }
    }

    XmlListModel {
        id: current
        source: root.source
        query: "/xml_api_reply/weather/current_conditions"

        XmlRole { name: "condition"; query: "condition/@data/string()" }
        XmlRole { name: "temp_c"; query: "temp_c/@data/string()" }

        onStatusChanged: {
            root.modelDataError = false
            if (status == XmlListModel.Error) {
                root.state = "Offline"
                root.statusMessage = "Error occurred: " + errorString()
                root.modelDataError = true
                //console.log("Weather Clock: Error reading current: " + root.statusMessage)
            } else if (status == XmlListModel.Ready) {
                // check if the loaded model is not empty, and post a message
                if (get(0) === undefined) {
                    root.state = "Offline"
                    root.statusMessage = "Invalid location \"" + root.location + "\""
                    root.modelDataError = true
                } else {
                    root.state = "Live Weather"
                    root.statusMessage = "Live current weather is available"
                }
                //console.log("Weather Clock: " + root.statusMessage)
            } else if (status == XmlListModel.Loading) {
                root.state = "Loading"
                root.statusMessage = "Current weather is loading..."
                //console.log("Weather Clock: " + root.statusMessage)
            } else if (status == XmlListModel.Null) {
                root.state = "Loading"
                root.statusMessage = "Current weather is empty..."
                //console.log("Weather Clock: " + root.statusMessage)
            } else {
                root.modelDataError = true
                console.log("Weather Clock: unknown XmlListModel status:" + status)
            }
        }
    }

    Timer {
        // note that this interval is not accurate to a second on a full minute
        // since we omit adjustment on seconds like in the clock interval
        // to simplify the code
        interval: root.interval*60000
        running: Qt.application.active && !root.forceOffline
        repeat: true
        onTriggered: {
            current.reload()
            forecast.reload()
        }
    }
}
