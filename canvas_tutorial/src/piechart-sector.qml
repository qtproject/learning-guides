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

Rectangle {
    id: root
    width: 360; height: 360
    color: "#3C3C3C"

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var centerX = width / 2
            var centerY = height / 2
            var radius = 0.9 * Math.min(width, height) / 2
            var startAngle = 45 * Math.PI / 180
            var endAngle = 135 * Math.PI / 180
            var anticlockwise = false
            var fillStyle = "#FFF0A5"
            var lineWidth = 2
            var strokeStyle = "#468966"

            var ctx = canvas.getContext('2d')

            ctx.clearRect(0, 0, width, height)

            // begin a new path
            ctx.beginPath()

            // move the cursor to the center
            ctx.moveTo(centerX, centerY)

            // add the arc including the line to the beginning of the arc
            ctx.arc(centerX, centerY, radius, startAngle, endAngle, anticlockwise)

            // add the line back to the center
            ctx.lineTo(centerX, centerY)

            // fill the piece
            ctx.fillStyle = fillStyle
            ctx.fill()

            // stroke the piece
            ctx.lineWidth = lineWidth
            ctx.strokeStyle = strokeStyle
            ctx.stroke()
        }
    }
}
