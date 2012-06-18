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
    property string location: "Munich"
    property bool tempInC: true
    property string baseURL: "http://www.google.com"
    property string dataURL: "/ig/api?weather="
    // some other values: "de", "es", "fi", "fr", "it", "ru"
    property string language: "en"

    width: 300
    height: 700

    function f2C (tempInF) {
        return  (5/9*(tempInF - 32)).toFixed(0)
    }

    XmlListModel {
        id: weatherModelCurrent
        source: baseURL + dataURL + location + "&hl=" + language
        query: "/xml_api_reply/weather/current_conditions"

        XmlRole { name: "condition"; query: "condition/@data/string()" }
        XmlRole { name: "temp_f"; query: "temp_f/@data/string()" }
        XmlRole { name: "humidity"; query: "humidity/@data/string()" }
        XmlRole { name: "icon_url"; query: "icon/@data/string()" }
        XmlRole { name: "wind_condition"; query: "wind_condition/@data/string()" }
    }

    Component {
        id: currentConditionDelegate
        Column {
            Text { text: qsTr("Today"); font.bold: true }
            Text { text: model.condition }
            Image { source: baseURL + model.icon_url }
            Text { text: model.temp_f + " F° / " + f2C (model.temp_f) + " C°" }
            Text { text: model.humidity }
            Text { text: model.wind_condition }
        }
    }

    XmlListModel {
        id: weatherModelForecast
        source: baseURL + dataURL + location  + "&hl=" + language
        query: "/xml_api_reply/weather/forecast_conditions"

        XmlRole { name: "day_of_week"; query: "day_of_week/@data/string()" }
        XmlRole { name: "low"; query: "low/@data/string()" }
        XmlRole { name: "high"; query: "high/@data/string()" }
        XmlRole { name: "icon_url"; query: "icon/@data/string()" }
        XmlRole { name: "condition"; query: "condition/@data/string()" }
    }

    Component {
        id: forecastConditionDelegate
        Column {
            spacing: 2
            Text { text: model.day_of_week; font.bold: true }
            Text { text: model.condition }
            Image { source: baseURL + model.icon_url }
            Text { text: qsTr("Lows: ") +
                         model.low +
                         " F° / "
                         + f2C (model.low) + " C°"}
            Text { text: qsTr("Highs: ") +
                         model.high +
                         " F° / " +
                         f2C (model.high) + " C°"}
        }
    }

    Column {
        id: allWeather
        anchors.centerIn: parent
        anchors.margins: 10
        spacing: 10

        Repeater {
            id: currentReportList
            model: weatherModelCurrent
            delegate: currentConditionDelegate
        }

        /* we can use a GridView...*/
        GridView {
            id: forecastReportList
            width: 220
            height: 220
            cellWidth: 110; cellHeight: 110
            model: weatherModelForecast
            delegate: forecastConditionDelegate
        }
        /**/

        /* ..a Repeater
        Repeater {
            id: forecastReportList
            model: weatherModelForecast
            delegate: forecastConditionDelegate
        }
        */
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
