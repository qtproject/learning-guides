..
    ---------------------------------------------------------------------------
    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.
    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .
    ---------------------------------------------------------------------------



Licensing
=========

For distribution of the learning material it is required that all files comes under a certrain license scheme. We differentiate between documentation and source code licenses.

Documentation License
---------------------

We license the documentation and the documentation files with a Creative Commons license.

In your main ``index.rst`` please add the following lines at the end::

    .. rubric:: Disclaimer

    Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).

    This work, unless otherwise expressly stated, is licensed under a
    Creative Commons Attribution-ShareAlike 2.5.

    The full license document is available from
    http://creativecommons.org/licenses/by-sa/2.5/legalcode .

    Qt® and the Qt logo is a registered trade mark of Digia plc and/or
    its subsidiaries and is used pursuant to a license from Digia plc
    and/or its subsidiaries. All other trademarks are property of their
    respective owners.

In each ``.rst`` file please add the following license text at the beginning of the file::

    ..
        ---------------------------------------------------------------------------
        Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
        This work, unless otherwise expressly stated, is licensed under a
        Creative Commons Attribution-ShareAlike 2.5.
        The full license document is available from
        http://creativecommons.org/licenses/by-sa/2.5/legalcode .
        ---------------------------------------------------------------------------


Source Code License
-------------------

Source Code will be licensed under the BSD license.

Please add the following to each qml/h/cpp/js file:

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
 or this::

    // ----------------------------------------------------------------------------
    //
    // Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
    // All rights reserved.
    //
    // See the LICENSE.txt file shipped along with this file for the license.
    //
    // ----------------------------------------------------------------------------

If you used the latter, in each projects root folder (where the .pro or .qmlproject file is located) please copy the :download:`LICENSE.txt <download/LICENSE.txt>` file with the following content:

.. literalinclude:: download/LICENSE.txt
