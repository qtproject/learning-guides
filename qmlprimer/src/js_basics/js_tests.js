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

// .pragma library // do not use this here, otherwise you cannot access the QML items

var flag = false  // a boolean

var x = 1., y = 2 // numbers can be integers and reals
var s1 = 'abc'; // a string
var x = 0; // 'number'

function do_tests() {

    print("\n")
    print("===============")
    print("The Type System")
    print("===============")

    var tests_types = [
                'typeof x',
                'typeof { x: 1 }',
                'typeof typeof { x : 1 }',
                'typeof JSON.parse(\'{\"a\": 7}\')',
                '1.3333333.toFixed(2)',
                '7..toString()',
                'typeof 1.',
                'typeof new Number(1.)',
                'typeof new String(\'Hi!\')'
            ]
    for (var i in tests_types)
        print ('\"', tests_types[i], '\" evaluates into: ', eval(tests_types[i]))

    print("\n")
    print("Now calling functions:")

    function f(x) { return f.A * x * x }
    f.A = 2.7
    print (f(2))

    function Buffer() {}
    print(Buffer.MAX_LINE_LENGTH = 4096)

    var o = { name: 'Werner', age: 84 } // allocate simple object
    //?????????????? print(o.name, o[age]) // both notations are valid, but [] notation allows generated strings

    var a = ['a', 'b', 7, 11.] // an array, equivalent to {'0': 'a', '1': 'b', '2': 7, '3': 11.}
    print (typeof o, a) // 'object', elements

    print("\n")
    print("===========")
    print("Expressions")
    print("===========")

    var tests_functions = [
                'function f() {}', // evaluates 'undefined'
                'function f() {} + 1', // evaluates to 1, because 'undefined' is casted to 0
                '(function() {})', // evaluates to a function object
                '(function() { return 0; })()', // evaluates to 0
                //?????????????? '{1;2;3} * 2' // evaluates to 6
            ]
    for (var i in tests_functions)
        print ('\"', tests_functions[i], '\" evaluates into: ', eval(tests_functions[i]))

    print("\n")
    print('=========================')
    print('Repetitions and Iterators')
    print('=========================')

    var a = [1,2,3,4]

    print("\n")
    print('This is done with a do-loop:')

    var i = 0
    do {
        print(i, a[i]*a[i])
        i++
    }
    while (i < a.length)

    print("\n")
    print('This is done via a while-loop:')

    var i = 0
    while (i < a.length) {
        print(i, a[i]*a[i])
        i++
    }

    print("\n")
    print('This is done via a for-loop:')

    for (i = 0; i < a.length; i++) {
        print(i, a[i]*a[i])
    }

    print("\n")
    print('This is done via an interation:')

    for (var i in a)
        print(i, a[i]*a[i])

    print("\n")
    print('For each member in o, the name is assigned to another member of k.')

    var o = {a0: 11, a1: 7, a2: 5}
    var k = []
    for (k[k.length] in o);
    print('Done! Lets check: ')
    for (i in k)
        print(i, k[i])

    print("\n")
    print('=================================')
    print('Labeled Loops, break and continue')
    print('=================================')

    label_x:
    for (var x = 0; x < 11; ++x) {
        print ('x=', x)
        for (var y = 0; y < 11; ++y) {
            print ('y=', y)
            print ('Result of: (x + y) % 7 is ', (x + y) % 7)
            if ((x + y) % 7 == 2)
                break label_x;

        }
    }

    print("\n")
    print('=====================')
    print('Objects and Functions')
    print('=====================')

    var p = { x: 0.1, y: 0.2 }

    print('z' in p) // false

    p.z = 0.3 // introduce new property 'z'
    print('z' in p) // true

    delete p.z // remove 'z' from p
    print(p.z) // undefined

    p.move = function(x, y) {
        this.x = x
        this.y = y
    }
    p.move(1, 1) // invoke a method
    print('"p" is at: (', p.x, ',', p.y, ')')

    print("\n")
    print('===========================')
    print('Prototype based Inheritance')
    print('===========================')

    var p = new Object
    p.x = 0.1
    p.y = 0.2
    print('"p" as a new Object has x=', p.x, ', y=', p.y)


    function Point(x, y) {
        this.x = x
        this.y = y
    }
    var p = new Point(1, 2)

    Point.prototype = new Object // can be omitted here
    Point.prototype.translate = function(dx, dy) {
        this.x += dx
        this.y += dy
    }

    var p0 = new Point(1, 1)
    var p1 = new Point(0, 1)
    p1.translate(1, -1)
    print('p1.x=', p1.x, 'p1.y=', p1.y)
    print(p0 === p1) // false
    print(p0.translate === p1.translate) // true

    print('Doing property check:')
    print(p0.hasOwnProperty("x")) // true
    print(p0.hasOwnProperty("translate")) // false

    print("\n")
    print('Some real object hierarchy:')

    function Point(x, y) {
        this.x = x
        this.y = y
    }
    Point.prototype = {
        move: function(x, y) {
            this.x = x
            this.y = y
        },
        translate: function(dx, dy) {
            this.x += dx
            this.y += dy
        },
        area: function() { return 0; }
    }

    function Ellipsis(x, y, a, b) {
        Point.call(this, x, y)
        this.a = a
        this.b = b
    }
    Ellipsis.prototype = new Point
    Ellipsis.prototype.area = function() { return Math.PI * this.a * this.b; }

    function Circle(x, y, r) {
        Ellipsis.call(this, x, y, r, r)
    }
    Circle.prototype = new Ellipsis

    var circle = new Circle(0, 0, 1)
    circle.move(1, 1)

    print('circle is at (', circle.x , ',', circle.y, ')')
    print('circle\'s area is ', circle.area())

    print("\n")
    print('Do a few tests with our objects:')

    var tests_objects = [
                'circle instanceof Circle', // true
                'circle instanceof Ellipsis', // true
                'circle instanceof Point', // true
                'circle instanceof Object', // true
                'circle instanceof Array', // false, is not an Array
                'circle.hasOwnProperty("x")', // true, assigned by the Point constructor
                'circle.hasOwnProperty("area")', // false
                '"area" in circle' // true
            ]

    for (var i in tests_objects)
        print ('\"', tests_objects[i], '\" evaluates into: ', eval(tests_objects[i]))

    function inspect(o) { for (var n in o) if (o.hasOwnProperty(n)) print(n, "=", o[n]); }

    print("\n")
    print('Inspect "circle":')
    inspect(circle)

    print('Inspect "circle.__proto__"')
    inspect(circle.__proto__)

    print('Inspect "circle.__proto__.__proto__"')
    inspect(circle.__proto__.__proto__)

    print('Inspect "circle.__proto__.__proto__.__proto__"')
    inspect(circle.__proto__.__proto__.__proto__)

    print("\n")
    print('==================================')
    print('Scopes, Closures and Encapsulation')
    print('==================================')

    print("\n")
    print('Check how we can reference the global object:')
    print(Math)

    function Point(x, y) {
        this.getX = function() { return x; }
        this.setX = function(x2) { x = x2; }
        this.getY = function() { return y; }
        this.setY = function(y2) { y = y2; }
    }
    print('Check if we still can access private members:')
    var p = new Point(1, 1)
    p.setX(2)
    print(p.x)
    print(p.getX())

    print("\n")
    print ('==========')
    print ('Namespaces')
    print ('==========')


    function PaintUtil() {
        PaintUtil.Point = function(x, y) {
            this.move = function(x2, y2) { x = x2; y = y2 }
            this.getX = function() { return x; }
            this.getY = function() { return y; }
        }
    }
    PaintUtil()
    var p = new PaintUtil.Point(0.1, 0.2)
    print ('paint point at: (', p.getX(), ',', p.getY(), ')')
    p.move(1, 1)
    print ('paint point at: (', p.getX(), ',', p.getY(), ')')

    print("\n")
    print ('==============')
    print ('Common Methods')
    print ('==============')

    Point.prototype.valueOf = function () {
        return Math.sqrt(this.getX() * this.getX() + this.getY() * this.getY());
    }
    Point.prototype.toString = function () {
        return this.getX().toString() + "," + this.getY().toString();
    }
    var p = new Point(0.1, 0.2)
    print ('value of the point:', p.valueOf())
    print ('point at:', p.toString())

    print("\n")
    print ('==========')
    print ('Exceptions')
    print ('==========')

    try {
        print ('Throw an exception!')
        throw me
    }
    catch (me) {
        print ('Got an exception!')
    }
    finally {
        print("\n")
        print ('All done!')
    }
    root.jsDone = true
}
