import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import Qt.labs.animation 1.0

Item {

    Rectangle {
        id: rectangle
        color: "#26282a"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rectangle1
            y: 50
            width: 383
            height: 376
            color: "#5f6a82"
            radius: 15
            border.color: "#00000000"
            border.width: 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.verticalCenterOffset: 32

            ComboBox {
                id: ports
                x: 31
                width: 159
                height: 40
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                anchors.topMargin: 80
                model: ["None","COM1", "COM2", "COM3","COM4","COM5","COM6","COM7"]
                background: Rectangle{
                    radius: 15
                }
                onCurrentValueChanged: com.text = ports.currentValue

            }

            Switch {
                id: switch1
                x: 48
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 170
                onCheckedChanged: {
                    if(switch1.checked == true){ parity.text = "ON"}
                    else{parity.text = "OFF"}
                }
            }
            CustomButton{
                id: connect
                y: 331
                width: 160
                height: 40
                text: "CONNECT"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                onClicked: {
                             backend.serialConnect(ports.currentValue,baudRate.text,parity.text)

                             }
            }

            GroupBox {
                id: groupBox
                width: 358
                height: 54
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 260
                anchors.leftMargin: 15
                title: qsTr("")
                background: Rectangle{
                    border.color: "transparent"
                    color: "transparent"

                }

                CustomRadioButton{
                    id: baud1
                    y: -5
                    text: "9600"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pointSize: 12
                    checked: true
                    radioActiveColor: "#55aaff"
                    anchors.leftMargin: 4
                    onCheckedChanged: {
                        if(baud1.checked == true){
                            baudRate.text = "9600"
                        }

                    }
                }

                CustomRadioButton {
                    id: baud2
                    x: 226
                    y: -5
                    text: "38400"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    font.pointSize: 12
                    checked: false
                    radioActiveColor: "#55aaff"
                    anchors.rightMargin: 4
                    onCheckedChanged: {
                        if(baud2.checked == true){
                            baudRate.text = "19200"
                        }

                    }
                }

                CustomRadioButton {
                    id: baud3
                    x: 116
                    text: "19200"
                    anchors.top: parent.top
                    font.pointSize: 12
                    checked: false
                    radioActiveColor: "#55aaff"
                    anchors.topMargin: -5
                    anchors.horizontalCenter: parent.horizontalCenter
                    onCheckedChanged: {
                        if(baud3.checked == true){
                            baudRate.text = "38400"
                        }

                    }
                }
            }

            Label {
                id: label
                x: 85
                y: 39
                width: 189
                height: 22
                color: "#26282a"
                text: qsTr("SELECCION DEL COM")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Verdana"
                anchors.horizontalCenterOffset: 8
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 15
            }

            Label {
                id: label1
                x: 89
                width: 189
                height: 22
                color: "#26282a"
                text: qsTr("PARIDAD")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 140
                font.pointSize: 15
                anchors.horizontalCenterOffset: 5
                font.family: "Verdana"
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }

            Label {
                id: label2
                x: 101
                width: 189
                height: 22
                color: "#26282a"
                text: qsTr("VELOCIDAD")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 230
                font.italic: false
                styleColor: "#26282a"
                font.pointSize: 15
                font.family: "Verdana"
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }

            CustomButton {
                id: connect1
                x: 210
                y: 331
                width: 160
                height: 40
                text: "DISCONNECT"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                colorPressed: "#610031"
                colorMouseOver: "#ff007f"
                colorDefault: "#d10069"
                anchors.rightMargin: 20
                anchors.bottomMargin: 20
                onClicked: {
                             backend.serialDisconnect()

                             }
            }
        }

        Rectangle {
            id: rectangle2
            height: 40
            color: "#5f6a82"
            radius: 20
            border.color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.leftMargin: 30
            anchors.rightMargin: 30

            Label {
                id: label5
                x: 80
                y: 4
                color: "#ffffff"
                text: qsTr("CONFIGURACION DE CONEXION")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Verdana"
                font.bold: true
                font.pointSize: 20
            }
        }

        Rectangle {
            id: point
            x: 722
            y: 100
            width: 20
            height: 20
            color: "#ffff00"
            radius: 10
            anchors.verticalCenter: label6.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
        }

        Label {
            id: label6
            x: 474
            width: 61
            height: 16
            color: "#ffffff"
            text: qsTr("ESTADO:")
            anchors.right: parent.right
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.rightMargin: 300
            anchors.topMargin: 100
            font.pointSize: 12
        }

        Label {
            id: stateConnection
            x: 586
            y: 100
            color: "#ffff00"
            text: qsTr("DESCONECTADO")
            anchors.verticalCenter: label6.verticalCenter
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            anchors.rightMargin: 100
            font.pointSize: 12
        }

        Rectangle {
            id: rectangle4
            x: 443
            y: 355
            width: 307
            height: 105
            color: "#5f6a82"
            radius: 15

            Label {
                id: label3
                x: 74
                width: 160
                height: 17
                text: qsTr("Configuraciones seleccionadas:")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 8
                font.pointSize: 12
                font.bold: true
            }

            Label {
                id: label4
                width: 49
                height: 14
                text: qsTr("Puerto:")
                anchors.left: parent.left
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 38
                anchors.leftMargin: 20
                font.pointSize: 10
                font.bold: true
            }

            Label {
                id: com
                x: 75
                y: 34
                width: 53
                height: 20
                color: "#73ef4c"
                text: qsTr("None")
                anchors.verticalCenter: label4.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 150
                font.bold: true
                font.pointSize: 10
            }

            Label {
                id: parity
                x: 75
                y: 54
                width: 53
                height: 20
                color: "#73ef4c"
                text: qsTr("OFF")
                anchors.verticalCenter: label8.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 150
                font.pointSize: 10
                font.bold: true
            }

            Label {
                id: label8
                width: 49
                height: 14
                text: qsTr("Paridad:")
                anchors.left: parent.left
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 58
                anchors.leftMargin: 20
                font.pointSize: 10
                font.bold: true
            }

            Label {
                id: label9
                width: 49
                height: 14
                text: qsTr("BaudRate:")
                anchors.left: parent.left
                anchors.top: parent.top
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 78
                anchors.leftMargin: 20
                font.pointSize: 10
                font.bold: true
            }

            Label {
                id: baudRate
                x: 75
                y: 75
                width: 53
                height: 20
                color: "#73ef4c"
                text: qsTr("9600")
                anchors.verticalCenter: label9.verticalCenter
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 150
                font.pointSize: 10
                font.bold: true
            }
        }

    }
    Connections{
        target: backend
        function onSetState(stateCon){
             if(stateCon === true){
             point.color = "green"
             stateConnection.text = "CONECTADO"
             stateConnection.color = "green"
             }
             else{
             point.color = "yellow"
             stateConnection.text = "DESCONECTADO"
             stateConnection.color = "yellow"
             }

         }
        function onSetError(error){
            point.color = "red"
            stateConnection.text = error
            stateConnection.color = "red"
        }
        function onSetDefect(stateCon){
             if(stateCon === true){
             point.color = "green"
             stateConnection.text = "CONECTADO"
             stateConnection.color = "green"
             }
             else{
             point.color = "yellow"
             stateConnection.text = "DESCONECTADO"
             stateConnection.color = "yellow"
             }

         }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/
