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

Rectangle {
    id: root

    property bool showDate: true
    property bool showSeconds: true
    property string currentTime
    property string currentDate
    // the sizes are in proportion to the hight of the clock.
    // There are three borders, text and date.
    // 3*borderProportion+timeTextProportion+dateTextProportion has to be 1.0
    property real borderProportion: 0.1
    property real timeTextProportion: 0.5
    property real dateTextProportion: 0.2
    property string textColor: "red"
    property string timeFormat: "hh :mm"
    property string dateFormat: "dd/MM/yy"

    height:120
    width:250

    color: "transparent"

    // returns formated time and date
    function getFormattedDateTime(format) {
        var date = new Date
        return Qt.formatDateTime(date, format)
    }

    function updateTime() {
        root.currentTime = "<big>" +
                getFormattedDateTime(timeFormat) +
                "</big>" +
                (showSeconds ? "<sup><small> " + getFormattedDateTime("ss") +
                               "</small></sup>" : "");
        root.currentDate = getFormattedDateTime(dateFormat);
    }

    Image {
        id: background
        source: "../content/resources/background.png"
        fillMode: "Tile"
        anchors.fill: parent
        onStatusChanged: if (background.status == Image.Error)
                             console.log (qsTr("Background image \"") +
                                          source +
                                          qsTr("\" cannot be loaded"))
    }

    FontLoader {
        id: ledFont
        // unfortunately, the font will not load on a Symbian device,
        // and the default font will be used:
        // http://bugreports.qt-project.org/browse/QTBUG-6611
        // The bug should be fixed in 4.8
        source: "../content/resources/font/LED_REAL.TTF"
        onStatusChanged: if (ledFont.status == FontLoader.Error)
                             console.log("Font \"" + source + "\" cannot be loaded")
    }

    Timer {
        id: updateTimer
        running: Qt.application.active && visible == true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            updateTime()
            // refresh the interval to update the time each second or minute.
            // consider the delta in order to update on a full minute
            interval = 1000*(showSeconds? 1 : (60 - getFormattedDateTime("ss")))
        }
    }

    // trigger an update if the showSeconds setting has changed
    onShowSecondsChanged: {
        updateTime()
    }

    Column {
        id: clockText
        anchors.centerIn: parent
        spacing: root.height*root.borderProportion

        Text {
            id: timeText
            textFormat: Text.RichText
            text: root.currentTime
            font.pixelSize: root.height*root.timeTextProportion
            font.family: ledFont.name // use "Series 60 ZDigi" on Symbian instead
            font.bold: true
            color: root.textColor
            style: Text.Raised
            styleColor: "black"
        }

        Text {
            id: dateText
            text: root.currentDate
            color: root.textColor
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: ledFont.name // use "Series 60 ZDigi" on Symbian instead
            font.pixelSize: root.height*root.dateTextProportion
            visible: root.showDate
            style: Text.Raised
            styleColor: "black"
        }
    }
}
