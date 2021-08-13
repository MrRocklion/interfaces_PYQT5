import QtQuick 2.0
import QtQuick.Controls 2.15
import Qt.labs.animation 1.0

Item {
    id: item1
    visible: true
    clip: false
    Rectangle {
        id: rectangle
        color: "#26282a"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            y: 215
            height: 250
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 25
            anchors.rightMargin: 25

            Rectangle {
                id: rectangle3
                height: 40
                color: "#55aaff"
                radius: 15
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                Switch {
                    id: switch1
                    x: 16
                    y: 0
                    text: qsTr("MOSTRAR MAS INFORMACION?")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 0
                    font.bold: true
                    font.pointSize: 15
                    onCheckedChanged: {
                        if(switch1.checked==true){
                          rectangle4.visible = true }
                        else{
                         rectangle4.visible = false
                        }
                    }
                }
            }

            Rectangle {
                id: rectangle4
                y: 181
                height: 104
                visible: false
                color: "#5f6a82"
                radius: 10
                border.width: 0
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 20
                anchors.rightMargin: 0

                Text {
                    id: information
                    color: "#ffffff"
                    text: "el objetivo de desarrollo de esta aplicacion es el poder implementar HMI mediante interfaces graficas \n desarroladas en python, para el desarrollo de esta aplicacion nos basamos en el uso de una plantilla \n  desarrollada por el programador Wanderson  , a partir de esta plantilla nosotros iremos agregando \n todos los widgets necesarios para la manipulacion"
                    anchors.fill: parent
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    minimumPixelSize: 14
                }
            }
        }

        Rectangle {
            id: rectangle2
            height: 137
            visible: true
            color: "#ffffff"
            radius: 25
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 60
            anchors.rightMargin: 25
            anchors.leftMargin: 25

            Label {
                id: label1
                x: 89
                y: 16
                width: 422
                height: 25
                text: qsTr("INTERFAZ DE MANEJO DE LEDS Y SERVO")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 90
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                font.pointSize: 15
                font.family: "San serif"
            }

            Label {
                id: label2
                width: 188
                height: 25
                text: qsTr("DESARROLLADOR: ")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 50
                anchors.leftMargin: 10
                font.family: "San serif"
                font.bold: true
                font.pointSize: 15
            }

            Label {
                id: label4
                x: 234
                y: 59
                width: 217
                height: 19
                text: qsTr("David Diaz(@MrRocklion)")
                anchors.verticalCenter: label2.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 150
                font.italic: true
                font.family: "Verdana"
                font.pointSize: 13
            }

            Label {
                id: label3
                y: 92
                width: 109
                height: 25
                text: qsTr("FECHA: ")
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.leftMargin: 10
                font.family: "San serif"
                font.bold: true
                font.pointSize: 15
            }

            Label {
                id: label5
                x: 435
                y: 96
                width: 115
                height: 19
                text: qsTr("12/08/2021")
                anchors.verticalCenter: label3.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 150
                font.italic: true
                font.family: "Verdana"
                font.pointSize: 13
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:3}D{i:6}D{i:5}D{i:2}D{i:9}D{i:11}D{i:12}
D{i:7}
}
##^##*/
