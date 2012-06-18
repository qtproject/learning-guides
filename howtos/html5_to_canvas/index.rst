..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

How to convert a html5 canvas into qml canvas
=============================================

We can almost simply copy the HTML5 code’s drawing function into the canvas element’s `onPaint` handler. We only need to change the line in which we acquire the drawing context: instead of using a DOM API, call (document.getElementById('canvas')), we access the canvas element directly. The JavaScript function used can be inserted as a member function of the element.

The HTML5 code looks like this:

.. code-block:: js

    function draw() {
      var ctx = document.getElementById('canvas').getContext('2d');
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
    function drawSpirograph(ctx,R,r,O){
      var x1 = R-O;
      var y1 = 0;
      var i  = 1;
      ctx.beginPath();
      ctx.moveTo(x1,y1);
      do {
        if (i>20000) break;
        var x2 = (R+r)*Math.cos(i*Math.PI/72) - (r+O)*Math.cos(((R+r)/r)*(i*Math.PI/72))
        var y2 = (R+r)*Math.sin(i*Math.PI/72) - (r+O)*Math.sin(((R+r)/r)*(i*Math.PI/72))
        ctx.lineTo(x2,y2);
        x1 = x2;
        y1 = y2;
        i++;
      } while (x2 != R-O && y2 != 0 );
      ctx.stroke();
    }


Porting it to the `Canvas` item in Qt Quick 2 will look like this:

.. code-block:: js

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
                var x2 = (R+r)*Math.cos(i*Math.PI/72) -
                     (r+O)*Math.cos(((R+r)/r)*(i*Math.PI/72))

                var y2 = (R+r)*Math.sin(i*Math.PI/72) -
                         (r+O)*Math.sin(((R+r)/r)*(i*Math.PI/72))

                ctx.lineTo(x2,y2);
                x1 = x2;
                y1 = y2;
                i++;
            } while (x2 != R-O && y2 != 0 );
            ctx.stroke();
        }
    }

