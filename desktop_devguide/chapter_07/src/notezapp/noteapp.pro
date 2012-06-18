# Add more folders to ship with the application, here
#folder_01.source = qml/noteapp
#folder_01.target = qml
#DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE68D5D88

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

RESOURCES += \
    qml/noteapp/application.qrc

OTHER_FILES += \
    qml/noteapp/noteDB.js \
    qml/noteapp/PagePanel.qml \
    qml/noteapp/Page.qml \
    qml/noteapp/NoteToolbar.qml \
    qml/noteapp/Note.qml \
    qml/noteapp/MarkerPanel.qml \
    qml/noteapp/Marker.qml \
    qml/noteapp/main.qml \
    qml/noteapp/Tool.qml \
    qml/noteapp/images/yellowmarker.png \
    qml/noteapp/images/workmarker.png \
    qml/noteapp/images/work_note.png \
    qml/noteapp/images/personalmarker.png \
    qml/noteapp/images/personal_note.png \
    qml/noteapp/images/page.png \
    qml/noteapp/images/notetoolbar.png \
    qml/noteapp/images/funmarker.png \
    qml/noteapp/images/fun_note.png \
    qml/noteapp/images/delete.png \
    qml/noteapp/images/close.png \
    qml/noteapp/images/clear.png \
    qml/noteapp/images/background.png \
    qml/noteapp/images/add.png







