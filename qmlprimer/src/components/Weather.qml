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
import "../js/style.js" as Style

Item {
    id: root
    property string labelText: qsTr("Title Looooong")
    property string conditionText: qsTr("Sunny")
    property string tempText: qsTr("-88C°/-99C°")

    width: Style.forecastCellWidth
    height: Style.forecastCellHeight

    Image {
        id: icon
        anchors.fill: parent
        smooth: true
        fillMode: Image.PreserveAspectCrop
        source: "../content/resources/weather_icons/" + conditionText.toLowerCase().split(' ').join('_') + ".png"
        onStatusChanged: if (status == Image.Error) {
                             // we set the icon to an empty image if we failed to find one
                             source = ""
                             console.log("no icon found for the weather condition: \""
                                         + conditionText + "\"")
        }
    }

    Text {
        id: label
        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width
        text: root.labelText
        font.bold: true
        font.pixelSize: root.height*Style.textSizeDayProportion
        horizontalAlignment: Text.AlignLeft
        wrapMode: "WordWrap"
        color: Style.forecastTextColor
        style: Text.Raised
        styleColor: "black"
    }

    Text {
        id: condition
        anchors.top: label.bottom
        anchors.left: label.left
        anchors.margins: 2
        text: root.conditionText
        font.bold: true
        font.pixelSize: root.height*Style.textSizeForecastProportion
        color: Style.forecastTextColor
        style: Text.Raised
        styleColor: "black"
    }

    Text {
        id: temp
        anchors.left: condition.left
        anchors.top: condition.bottom
        text: root.tempText
        font.pixelSize: root.height*Style.textSizeTempProportion
        color: Style.forecastTextColor
        style: Text.Raised
        styleColor: "black"
    }
}
