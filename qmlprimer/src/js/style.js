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

// ".pragma library" can be used here, but is not needed since style
// stettings are static values

// the background image displayed in the main app
var backgroundImage = "../content/resources/background.png"

// color used to paint text and button borders
var penColor = "grey"

// size of of the UI texts
var textPixelSize = 20

// ??
var baseMargin = 10

// background color for UI elements used when the backgroundImage is not visible
var backgroundColor = "black"

// borders of dialogs and buttons
var borderWidth = 2
var borderRadius = 4

// styles for the Weather delegate
var forecastTextColor = "white"
var forecastCellWidth = 128
var forecastCellHeight = 128
var forecastTempColor = "red"
var iconProportion = 0.9
var textSizeDayProportion = 0.25
var textSizeForecastProportion = 0.15
var textSizeTempProportion = 0.2

// styles for the clock component
// the sizes are in proportion to the hight of the clock.
// There are three borders, text and date.
// 3*borderProportion+timeTextProportion+dateTextProportion has to be 1.0
var borderProportion = 0.1
var timeTextProportion = 0.6
var dateTextProportion = 0.4
var clockFaceColor = "transparent"
var offlineClockTextColor = "orange"
var onlineClockTextColor = "red"
var dateFormat = "dd/MM/yy"
// alternative date format
// var dateFormat = "MM/dd/yy"
var timeFormat = "hh :mm"


