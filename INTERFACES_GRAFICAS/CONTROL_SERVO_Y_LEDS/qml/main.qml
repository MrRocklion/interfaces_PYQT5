import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.animation 1.0
import QtQuick.Controls 2.15
import "controls"
import QtGraphicalEffects 1.15
Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumWidth: 1000
    minimumHeight: 580
    visible: true
    color: "#00000000"
    title: qsTr("Gestion de cuentas ")
    flags: Qt.Window | Qt.FramelessWindowHint //esta linea remueve la ventana por defecto
    property  int windowStatus: 0
    property int  windowMargin: 10
    //la ventana
    QtObject{
        id: internal
        function resetResizeBorders(){
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }
        function maximizeRestore(){
            if(windowStatus==0){
                mainWindow.showMaximized()
                windowStatus =1
                windowMargin = 0
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus=0
                windowMargin=10
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }
        function ifMaximizedWindowRestore(){
                    if(windowStatus == 1){
                        mainWindow.showNormal()
                        windowStatus = 0
                        windowMargin = 10
                        internal.resetResizeBorders()
                        btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"


                    } }
        function restoreMargins(){
                    windowStatus = 0
                    windowMargin = 10
                    internal.resetResizeBorders()
                    btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
                    // Resize visibility

                }
    }
    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z:1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 20
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 70
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#5f6a82"
                        text: qsTr("Elaborado Por MrRocklion")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#5f6a82"
                        text: qsTr("| HOME")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0
                    DragHandler{
                    onActiveChanged: if(active){
                                         mainWindow.startSystemMove()
                                         internal.ifMaximizedWindowRestore()
                                     }
                    }
                    Image {
                        id: iconApp
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/laptop-code-solid.svg"
                        autoTransform: false
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }
                    ColorOverlay {
                           anchors.fill: iconApp
                           source: iconApp
                           color: "#55aaff"  // make image like it lays under red glass
                       }
                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("HMI PARA MANEJO DE LEDS Y SERVOMOTORES")
                        anchors.left: iconApp.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 30
                    }
                }

                Row {
                    id: row
                    x: 872
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: btnMinimize
                        btnColorPressed: "#ff007f"
                        onClicked: {

                            mainWindow.showMinimized()
                            internal.restoreMargins()
                    }}

                    TopBarButton {
                        id: btnExpand
                        btnColorPressed: "#ff007f"
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorPressed: "#ff007f"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    clip: true
                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70)return 200; else return 70
                        duration: 1000
                        easing.type: Easing.InOutQuint

                    }

                    Column {
                        id: columnMenus
                        width: 250
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Home")
                            isActiveMenu: false
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnOpen.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                labelRightInfo.text = "| HOME"
                                pagesView.setSource(Qt.resolvedUrl("pages/homePage.qml"))

                        }}

                        LeftMenuBtn {
                            id: btnOpen
                            width: leftMenu.width
                            text: qsTr("Open")
                            btnIconSource: "../images/svg_images/microchip-solid.svg"
                            onClicked:  {
                                btnHome.isActiveMenu = false
                                btnOpen.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                labelRightInfo.text = "| HMI"
                                pagesView.setSource(Qt.resolvedUrl("pages/hmi1.qml"))
                                backend.leftButtons()
                            }
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        x: 0
                        y: 413
                        width: leftMenu.width
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnOpen.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            labelRightInfo.text = "| CONFIGURACIONES"
                            pagesView.setSource(Qt.resolvedUrl("pages/settings.qml"))
                            backend.leftButtons()

                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    width: 908
                    height: 452
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    Loader{
                        id: pagesView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/homePage.qml")
                    }

                }

                Rectangle {
                    id: rectangle
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelBottonInfo
                        color: "#5f6a82"
                        text: qsTr("Elaborado Por MrRocklion")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 30
                    }

                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 0
                        width: 25
                        height: 25
                        opacity: 0.5
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if (active){
                            mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }
                        Image {
                                   id: resizeImage
                                   width: 16
                                   height: 16
                                   anchors.fill: parent
                                   source: "../images/svg_images/resize_icon.svg"
                                   anchors.leftMargin: 5
                                   anchors.topMargin: 5
                                   sourceSize.height: 16
                                   sourceSize.width: 16
                                   fillMode: Image.PreserveAspectFit
                                   antialiasing: false
                               }
                    }
                }
            }
        }

    }


    DropShadow{
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }
    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) { mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }
Connections{
    target: backend

}

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
