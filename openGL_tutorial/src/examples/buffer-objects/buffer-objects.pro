QT += core gui opengl

TARGET = buffer-objects

TEMPLATE = app

SOURCES += main.cpp\
           glwidget.cpp

HEADERS += glwidget.h

OTHER_FILES += coloringFragmentShader.fsh\
               coloringVertexShader.vsh\
               lightingFragmentShader.fsh\
               lightingVertexShader.vsh

RESOURCES += resources.qrc
