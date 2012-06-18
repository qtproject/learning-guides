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

Canvas {
    id: canvas
    width: 300
    height: 300

    // the function "draw()" can be put into the "onPaint" handler
    onPaint: {

        // the acquisition of the rendering context needs to be adapted
        var ctx = canvas.getContext('2d');

        ctx.fillRect(0,0,300,300);
        for (var i=0;i<3;i++) {
            for (var j=0;j<3;j++) {
                ctx.save();
                ctx.strokeStyle = "#9CFF00";
                ctx.translate(50+j*100,50+i*100);
                drawSpirograph(ctx,20*(j+2)/(j+1),-8*(i+3)/(i+1),10);
                ctx.restore();
            }
        }
    }

    // the utility function "drawSpirograph()" can remain unchanged
    function drawSpirograph(ctx,R,r,O) {
        var x1 = R-O;
        var y1 = 0;
        var i  = 1;
        ctx.beginPath();
        ctx.moveTo(x1,y1);
        do {
            if (i>20000) break;
            var x2 = (R+r)*Math.cos(i*Math.PI/72)
                     - (r+O)*Math.cos(((R+r)/r)*(i*Math.PI/72))

            var y2 = (R+r)*Math.sin(i*Math.PI/72)
                     - (r+O)*Math.sin(((R+r)/r)*(i*Math.PI/72))

            ctx.lineTo(x2,y2);
            x1 = x2;
            y1 = y2;
            i++;
        } while (x2 != R-O && y2 != 0 );
        ctx.stroke();
    }
}
