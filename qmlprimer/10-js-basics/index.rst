..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    All rights reserved.
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------

.. _primer-javascript-annex:

Annex. JavaScript Language Overview
====================================

This article provides an overview of the JavaScript language. The idea is to provide a thorough overview of all of the language's features. You may want to read through this article from start to finish to learn about all the basic features of this language - especially when you are getting started with a JavaScript related technology.

This article is a slightly modified copy of the `"JavaScript Language Overview" <http://qt-project.org/wiki/JavaScript>`_ article on the Qt Project Wiki. Its content has been tested on Qt 4.8 with Qt Quick 1.1. Additionally, this article provides a Qt Quick application which runs all code examples listed below. This application is available in the ``js_basics`` folder in ``qt_quick_app_dev_intro_src.zip``, see the :ref:`get-primer-source-code` section.

Introduction
-------------

JavaScript is a minimalistic dynamically typed scripting language. It is truly object-oriented, although it lacks support for classes. Frequently associated with client-side web development, JavaScript is a language of its own. Originally developed at Netscape and nowadays standardized as `"ECMAScript-262 (3rd and 5th edition)" <http://www.ecma-international.org/publications/standards/Ecma-262.htm>`_ , the language has found wide-spread use and circulates under various names. "JScript" is Microsoft's derivative of the language. "JavaScript" was the original name chosen by Netscape when the language was introduced with Netscape 2. Adobe's ActionScript was also based on ECMAScript-262 before version 3 was released.

Qt has been supporting a JavaScript engine compatible with ECMAScript-262 since Qt 4.3. This engine is called "QtScript" and was originally an independent implementation. Since Qt 4.5, QtScript has been based on JavaScriptCore from WebKit. Qt Quick makes intense use of QtScript.

The Type System
----------------

JavaScript supports the following fundamental types:

     boolean
     number
     string
     object
     function

New variables are introduced into the current scope using the ``var`` statement:

.. code-block:: js

    var flag = false  // a boolean
    var x = 1., y = 2 // numbers can be integers and reals
    var s1 = 'abc'; // a string

To query the type of a variable, use the ``typeof`` keyword. ``typeof`` returns the name of the type as a string.

.. code-block:: js

    var x = 0; typeof x // 'number'
    typeof { x: 1 } // 'object'
    typeof typeof { x : 1 } // 'string'
    typeof JSON.parse('{"a": 7}') // 'object'

Everything in JavaScript acts like an object.

.. code-block:: js

    1.3333333.toFixed(2) // '1.33'
    7..toString() // '7'

Note that in JavaScript the expression ``7.toString()`` can't be interpreted correctly. ``7.`` is parsed into a number and thereafter results in a syntax error.

The primitive types ``boolean``, ``number`` and ``string`` are implicitly converted into objects when needed. For this purpose, the global object provides special constructor functions which can also be invoked manually:

.. code-block:: js

    typeof 1. // 'number'
    typeof new Number(1.) // 'object'
    typeof new String('Hi!') // 'object'

Functions are special kinds of objects. They only differ from objects because they can be called and used as constructors. Properties can be added to functions dynamically:

.. code-block:: js

    function f(x) { return f.A      x * x }
    f.A = 2.7

    function Buffer() {}
    Buffer.MAX_LINE_LENGTH = 4096

Usually those properties serve as global constants and therefore are written in uppercase.

Objects themselves can be expressed using an array or object literal. Arrays have no separate type, but are specialized objects which use array indexes as properties:

.. code-block:: js

    var o = { name: 'Werner', age: 84 } // allocate simple object
    print(o.name, o[age])
    // both notations are valid, but [] notation allows generated strings
    var a = ['a', 'b', 7, 11.]
    // an array, equivalent to {'0': 'a', '1': 'b', '2': 7, '3': 11.}
    typeof o, a // 'object', 'object'

Expressions
------------

The expression syntax follows mostly "C" syntax (as in C++ or Java). As a major difference, there is no sharp distinction between statements and expressions. Basically everything evaluates to something. Function declarations and compounds can be included on-the-fly:

.. code-block:: js

    function f() {} // evaluates 'undefined'
    function f() {} + 1 // evaluates to 1, because 'undefined' is casted to 0
    (function() {}) // evaluates to a function object
    (function() { return 0; })() // evaluates to 0

Expressions are separated by semicolons or line breaks.

Branching
----------

Conditional branches follow "C" syntax.

.. code-block:: js

    if (<expression>)
        <statement1>
    else // optional
        <statement2> // optional

The switch statement follows the same fall through semantics as in "C":

.. code-block:: js

    switch(<expression>) {
        case <expression>:
            <statement-list-1>
            break;
        case <expression>:
            <statement-list-2>
            break;
        ...
        default:
            <statement-list-n>
    }

Repetitions and Iterators
--------------------------

Repeated actions can be expressed using ``do``, ``while`` and ``for`` loops:

.. code-block:: js

    ...
    do <statement> while (<expression>)
    ...
    while (<expression>) <statement>
    ...
    for (<init-expression>;<test-expression>;<step-expression>) <statement>
    ...


For iterating objects JavaScript provides a special ``for-in`` statement:

.. code-block:: js

    for (<expression>; in <object>;) <statement>

The given expression needs to be suitable for the left-hand side of an assignment. In the simplest case, it is just a variable declaration. Consider the following example:

.. code-block:: js

    var a = [1,2,3,4]
    for (var i in a)
        print(i, a[i]    a[i])
    // '0', 1
    // '1', 4
    // '2', 9
    // '3', 16

Here the variable ``i`` is assigned to all keys of the array ``a`` consecutively.  In the next example, the left-hand expression is dynamically generated:

.. code-block:: js

    var o = {a0: 11, a1: 7, a2: 5}
    var k = []
    for(k[k.length] in o);

The keys of ``o`` are copied to ``k``. The loop statement itself is left empty. For each member in ``o``, the name is assigned to another member of ``k``.

Labeled Loops, Break and Continue
----------------------------------

In JavaScript, loop statements can be given labels. The ``break`` and ``continue`` statements break or continue the current loop. It is possible to break an outer loop from the inner loop by using the label name as shown in the following example:

.. code-block:: js

    label_x:
    for (var x = 0; x < 11; ++x) {
        for (var y = 0; y < 11; ++y) {
            if ((x + y) % 7 == 0) break label_x;
        }
    }

Objects and Functions
----------------------

Objects are created using an object literal or the ``new`` operator.

In the following example, a point coordinate is expressed as an object literal:

.. code-block:: js

    var p = { x: 0.1, y: 0.2 }


Objects are entirely dynamic sets of properties. New properties are introduced on first assignment. They can be deleted again by using the ``delete`` operator.  To query if an object contains a certain property, use the ``in`` operator.

.. code-block:: js

    'z' in p // false
    p.z = 0.3 // introduce new property 'z'
    'z' in p // true
    delete p.z // remove 'z' from p
    p.z // undefined


Property values can be of any type - including the ``function`` type. Methods in JavaScript are just function properties. When a function is invoked in method notation, it gets passed a reference to the object as an implicit argument called ``this``.

.. code-block:: js

    p.move = function(x, y) {
        this.x = x
        this.y = y
    }
    p.move(1, 1) // invoke a method


JavaScript allows any function to be called as a method of any object by using the ``call`` method, however, there are only a few cases in which you would want to use the ``call`` method.

.. code-block:: js

    p2 = { x: 0, y: 0 }
    p.move.call(p2, 1, 1)


Prototype based Inheritance
----------------------------

The second way of creating objects is by using the ``new`` keyword together with a     constructor function*:

.. code-block:: js

    var p = new Object
    p.x = 0.1
    p.y = 0.2

The ``new`` operator allocates a new object and calls the given constructor to initialize the object. In this case, the constructor is called ``Object``, but it could be any other function as well. The constructor function gets passed the newly created object as the implicit ``this`` argument. In JavaScript there are no classes, but hierarchies of constructor functions which operate like object factories. Common constructor functions are written with a starting capital letter to distinguish them from average functions. The following example shows how to create point coordinates using a constructor function:

.. code-block:: js

    function Point(x, y) {
        this.x = x
        this.y = y
    }
    var p = new Point(1, 2)


Each function in JavaScript can be used as a constructor in combination with the ``new`` operator. To support inheritance, each function has a default property named ``prototype``. Objects created from a constructor inherit all properties from the constructor's prototype. Consider the following example:

.. code-block:: js

    function Point(x, y) {
        this.x = x
        this.y = y
    }
    Point.prototype = new Object // can be omitted here
    Point.prototype.translate = function(dx, dy) {
        this.x += dx
        this.y += dy
    }


First we declared a new function called ``Point`` which is meant to initialize a point. Thereafter we create our own prototype object, which in this case is redundant. The prototype of a function already defaults to an empty object. Properties which should be shared among all points are assigned to the prototype. In this case, we define the ``translate`` function which moves a point by a certain distance.

We can now instantiate points using the Point constructor:

.. code-block:: js

    var p0 = new Point(1, 1)
    var p1 = new Point(0, 1)
    p1.translate(1, -1)
    p0 === p1 // false
    p0.translate === p1.translate // true


The ``p0`` and ``p1`` objects carry their own ``x`` and ``y`` properties, but they share the ``translate`` method. Whenever an object's property value is requested by name, the underlying JavaScript engine first looks into the object itself and, if it doesn't contain that name, it falls back to the object's prototype. Each object carries a copy of its constructor's prototype for this purpose.

If an object actually contains a certain property, or if it is inherited, it can be inquired using the ``Object.hasOwnProperty()`` method.

.. code-block:: js

    p0.hasOwnProperty("x") // true
    p0.hasOwnProperty("translate") // false


So far, we have only defined a single constructor with no real object hierarchy. We will now introduce two additional constructors to show how to chain prototypes and thereby build up more complex relationships between objects:

.. code-block:: js

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
    Ellipsis.prototype.area = function() { return Math.PI      this.a * this.b; }

    function Circle(x, y, r) {
        Ellipsis.call(this, x, y, r, r)
    }
    Circle.prototype = new Ellipsis


Here we have three constructors which create points, ellipsis and circles. For each constructor, we have set up a prototype. When a new object is created using the ``new`` operator, the object is given an internal copy of the constructor's prototype. The internal reference to the prototype is used when resolving property names which are not directly stored in an object. Thereby properties of the prototypes are reused among the objects created from a certain constructor. For instance, let us create a circle and call its ``move`` method:

.. code-block:: js

    var circle = new Circle(0, 0, 1)
    circle.move(1, 1)

The JavaScript engine first looks into the ``circle`` object to see if it has a ``move`` property. As it can't find one, it asks for the prototype of ``circle``. The circle object's internal prototype reference was set to ``Circle.prototype`` during construction. It was created using the ``Ellipsis`` constructor, but it doesn't contain a ``move`` property either. Therefore, the name resolution continues with the prototype's prototype, which is created with the ``Point`` constructor and contains the ``move`` property, whereby the name resolution succeeds. The internal prototype references are commonly referred to as the     prototype chain* of an object.

To query information about the prototype chain, JavaScript provides the ``instanceof`` operator.

.. code-block:: js

    circle instanceof Circle // true
    circle instanceof Ellipsis // true
    circle instanceof Point // true
    circle instanceof Object // true
    circle instanceof Array // false, is not an Array


As properties are introduced when they are first assigned, properties delivered by the prototype chain are overloaded when newly assigned. The ``Object.hasOwnProperty`` method and the ``in`` operator allow the place where a property is stored to be investigated.

.. code-block:: js

    circle.hasOwnProperty("x") // true, assigned by the Point constructor
    circle.hasOwnProperty("area") // false
    "area" in circle // true


As can be seen, the ``in`` operator resolves names using the prototype chain, while the ``Object.hasOwnProperty`` only looks into the current object.

In most JavaScript engines, the internal prototype reference is called ``__proto__`` and is accessible from the outside. In our next example, we will use the ``__proto__`` reference to explore the prototype chain. Because this property is non-standard, you should avoid using it in all other contexts.
First let us define a function to inspect an object by iterating its members:

.. code-block:: js

    function inspect(o) { for (var n in o) if (o.hasOwnProperty(n)) print(n, "=", o[n]); }


The ``inspect`` function prints all members stored in an object so if we now apply this function to the ``circle`` object as well as to its prototypes, we obtain the following output:

.. code-block:: js

    js> inspect(circle)
    x = 1
    y = 1
    a = 1
    b = 1
    js> inspect(circle.__proto__)
    x = undefined
    y = undefined
    a = undefined
    b = undefined
    js> inspect(circle.__proto__.__proto__)
    x = undefined
    y = undefined
    area = function () { return Math.PI      this.a * this.b; }
    js> inspect(circle.__proto__.__proto__.__proto__)
    move = function (x, y) {
            this.x = x
            this.y = y;
        }
    translate = function (dx, dy) {
            this.x += dx
            this.y += dy;
        }
    area = function () { return 0; }
    js> inspect(circle.__proto__.__proto__.__proto__.__proto__)
    js>


As you can see, the ``move`` method is actually stored in ``circle.__proto__.__proto__.__proto__``. You can also see a lot of redundant undefined members, but this shouldn't cause you any concern as prototype objects are shared among instances.

Scopes, Closures and Encapsulation
-----------------------------------

In JavaScript, execution starts in the global scope. Predefined global functions like ``Math`` or ``String`` are properties of the global object. The global object serves as the root of the scope chain and is the first object created. In addition to the standard properties of the global object (see :qt:`Qt Quick ECMAScript Reference<ecmascript.html>`), Qt Quick provides a :qt:`Qt global object <qdeclarativeglobalobject.html>` with some additional properties.

Usually, the global object can be referenced from the global scope by explicitly using the ``this`` keyword. The value of ``this`` is currently undefined in Qt Quick in the majority of contexts. See "QML JavaScript Restrictions" in :qt:`Integrating JavaScript<qdeclarativejavascript.html>` in Qt documentation.

Further scopes are created on-demand whenever a function is called. Scopes are destroyed as any other object when they are no longer needed. When a function is defined, the enclosing scope is kept with the function definition and used as the parent scope for the function invocation scope. The new scope that is created upon function invocation is commonly referred to as the     activation object*. The scope in which functions are defined is commonly referred to as the *lexical scope*.

The following example shows how to use lexical scopes to hide private members:

.. code-block:: js

    function Point(x, y) {
        this.getX = function() { return x; }
        this.setX = function(x2) { x = x2; }
        this.getY = function() { return y; }
        this.setY = function(y2) { y = y2; }
    }

When the ``Point`` constructor is invoked, it creates get and set methods. The newly generated scope for the invocation of the ``Point`` constructor carries the ``x`` and ``y`` members. The getters and setters reference this scope and therefore it will be retained for the lifetime of the newly created object. Interestingly there is no other way to access ``x`` and ``y`` other than via the set and get methods. This way JavaScript supports     data encapsulation*.

The concept of a function referencing the enclosing scope and retaining it for the lifetime of the function is commonly called a     closure*. Low-level programming languages like "C" do not support closures because local scopes are created using stack frames and therefore need to be destroyed when the function returns.

Namespaces
-----------

Functions play a pivotal role in JavaScript. They serve as simple functions, methods, constructors and are used to encapsulate private properties. Additionally functions serve as anonymous namespaces:

.. code-block:: js

    (function() {
        // my code
        var smth = new Smth     // safe
        other = [1,2,3]         // bad, goes into global scope
        Array = function() {}   // forbidden
    }) ()
    var smthElse = {}           // bad, goes into global scope


An anonymous function is defined and executed on-the-fly. Global initialization code in particular is commonly wrapped in such a way to prevent polluting the global scope. As the global object can be modified as any other object in JavaScript, wrapping code in such a way reduces the risk of accidentally overwriting a global variable. To ensure that it actually works, all variables need to be duly introduced using the ``var`` statement.

Named namespaces can also be created with functions. If for instance we wanted to write a utility library for painting applications, we could write:

.. code-block:: js

    function PaintUtil() {
        PaintUtil.Point = function(x, y) {
            this.move = function(x2, y2) { x = x2; y = y2 }
            this.getX = function() { return x; }
            this.getY = function() { return y; }
        }
        // Ellipsis, Circle, other painting utility methods
    }
    PaintUtil()


Once this little library module is executed, it will provide the single ``PaintUtil`` object which makes the utility functions accessible. A point can be instantiated using the constructor provided by ``PaintUtil`` as follows:

.. code-block:: js

    var p = new PaintUtil.Point(0.1, 0.2)

Reusable JavaScript modules should only introduce a single global object with a distinguishable name.

Common Methods
---------------

JavaScript allows the default behavior of an object to be changed using the ``valueOf()`` and the ``toString()`` methods. ``valueOf()`` is expected to return a value of fundamental type. It is used to compare objects (when sorting them) and to evaluate expressions comprising of objects and fundamental types. ``toString()`` is invoked when an object is cast to a string.
In JavaScript, objects are compared for equality differently than for being greater or lower. Comparison for equality always compares the object references. Comparison for being lower or greater, on the other hand, converts objects by first converting the objects to values of fundamental types. First ``valueOf()`` is invoked and, if it doesn't return a fundamental type, it calls ``toString()`` instead.

For our ``Point`` class, we could define the methods as follows:

.. code-block:: js

    Point.prototype.valueOf = function () {
        return Math.sqrt(this.getX()      this.getX() + this.getY() * this.getY());
    }
    Point.prototype.toString = function () {
        return this.getX().toString() + "," + this.getY().toString();
    }


Exceptions
-----------

JavaScript provides an exception handling mechanism like most other high-level languages. Exceptions are thrown using the ``throw`` statement. Any value can be used as an exception object:

.. code-block:: js

    throw <expression>;


When an exception is thrown, JavaScript unwinds the current scope until it arrives at a try-catch scope:

.. code-block:: js

    try {
        <statement-list>
    }
    catch (<name for exception object>) {
        // handle exception
    }
    finally {
        // always go through here
    }


The name of the exception object is only locally defined inside the catch scope.
Exceptions can be re-thrown.

Resources
---------

Useful web links:

     `"The JavaScript Reference" <https://developer.mozilla.org/en/JavaScript/Reference>`_ on the Mozilla Developer Network
     `"JavaScript. The core." by Dmitry A. Soshnikov" <http://dmitrysoshnikov.com/ecmascript/javascript-the-core/>`_
     `"Changes to JavaScript: EcmaScript 5  by Mark Miller" <http://www.youtube.com/watch?v=Kq4FpMe6cRs>`_ - a video from Google Tech Talk, May 18, 2009
     `"Standard ECMA-262" <http://www.ecma-international.org/publications/standards/Ecma-262.htm>`_ - PDF download of the official standard


Recommended Books:

     `"JavaScript: The Good Parts" by Douglas Crockford <http://oreilly.com/catalog/9780596517748.do>`_
     "Part I - Core JavaScript" in `"JavaScript: The Definitive Guide" by David Flanagan <http://shop.oreilly.com/product/9780596805531.do>`_

