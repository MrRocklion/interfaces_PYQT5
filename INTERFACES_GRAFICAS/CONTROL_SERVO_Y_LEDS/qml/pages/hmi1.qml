import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Controls.Universal 2.0
import "../controls"
import Qt.labs.animation 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#26282a"
        border.color: "#00000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Rectangle {
                id: rectangle3
                x: 733
                y: 15
                height: 35
                color: "#00000000"
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Label {
                    id: stateHmi
                    x: 598
                    y: 15
                    width: 107
                    height: 20
                    color: "#ffff00"
                    text: qsTr("Desactivado")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 80
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: label
                    x: 507
                    y: 15
                    width: 77
                    height: 21
                    color: "#ffffff"
                    text: qsTr("Arduino:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 190
                    font.bold: true
                    font.pointSize: 12
                }

                Rectangle {
                    id: point
                    x: 733
                    y: 15
                    width: 20
                    height: 20
                    color: "#ffff00"
                    radius: 10
                    border.width: 0
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 30
                }
            }

            Rectangle {
                id: rectangle2
                color: "#00000000"
                radius: 25
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle3.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 0



                Rectangle {
                    id: rectangle4
                    x: 47
                    y: 52
                    width: 248
                    height: 345
                    color: "#f8c471"
                    radius: 25
                    border.width: 0

                    Switch {
                        id: switch1
                        x: 46
                        y: 45
                        text: qsTr("LED 1")
                        font.bold: true
                        font.pointSize: 10
                        onCheckedChanged: {
                            backend.led1(switch1.checked)
                        }
                    }

                    Switch {
                        id: switch2
                        x: 46
                        y: 96
                        text: qsTr("LED2")
                        font.bold: true
                        font.pointSize: 10
                        onCheckedChanged: {
                            backend.led2(switch2.checked)
                        }
                    }

                    Switch {
                        id: switch3
                        x: 46
                        y: 154
                        text: qsTr("LED3")
                        font.bold: true
                        font.pointSize: 10
                        onCheckedChanged: {
                            backend.led3(switch3.checked)
                        }
                    }

                    Switch {
                        id: switch5
                        x: 48
                        y: 256
                        text: qsTr("LED5")
                        font.bold: true
                        font.pointSize: 10
                        onCheckedChanged: {
                            backend.led5(switch5.checked)
                        }
                    }

                    Switch {
                        id: switch4
                        x: 46
                        y: 206
                        text: qsTr("LED4")
                        font.bold: true
                        font.pointSize: 10
                        onCheckedChanged: {
                            backend.led4(switch4.checked)
                        }
                    }
                }

                Rectangle {
                    id: rectangle5
                    x: 356
                    y: 57
                    width: 360
                    height: 340
                    color: "#ffffff"
                    radius: 25
                    border.width: 0

                    CustomDial{
                        id: degreeIndicator
                        x: 79
                        y: 11
                        value: 0
                        anchors.horizontalCenter: parent.horizontalCenter
                        colorArrow: "#26282a"
                        colorDial2: "#00ff00"
                        colorDial: "#00ff00"
                        enabled: true
                        stepSize: 1

                        Label {
                            id: angulo
                            x: 52
                            y: 38
                            width: 100
                            height: 109
                            text: qsTr("0°")
                            anchors.verticalCenter: parent.verticalCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pointSize: 30
                        }
                        onValueChanged: {

                            angulo.text = String(parseInt(degreeIndicator.value)) + "°"
                        }
                        to: 180
                        from: 0

                    }

                    Slider {
                        id: slider
                        x: 5
                        y: 242
                        width: 329
                        height: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        stepSize: 10
                        to: 180
                        from: 0
                        value: 0
                        onPressedChanged:
                        {

                            backend.servo1(slider.value)
                        }
                        onValueChanged: {

                            degreeIndicator.value = slider.value

                        }

                    }
                }

                Rectangle {
                    id: rectangle6
                    x: 47
                    y: 8
                    width: 248
                    height: 38
                    color: "#55aaff"
                    radius: 15

                    Label {
                        id: label1
                        x: 8
                        y: 17
                        text: qsTr("ACTIVACION DE LEDS")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenterOffset: 1
                        font.bold: true
                        font.pointSize: 15
                    }
                }

                Rectangle {
                    id: rectangle7
                    x: 356
                    y: 8
                    width: 360
                    height: 38
                    color: "#55aaff"
                    radius: 15
                    Label {
                        id: label2
                        x: 8
                        y: 17
                        text: qsTr("CONTROL DE SERVOMOTOR")
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: 1
                        font.bold: true
                        font.pointSize: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
    Connections{
        target: backend
        function onSetDefect(stateCon){
            if(stateCon === true){
                point.color = "green"
                stateHmi.text = "CONECTADO"
                stateHmi.color = "green"
            }
            else{
                point.color = "yellow"
                stateHmi.text = "DESCONECTADO"
                stateHmi.color = "yellow"
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:20}
}
##^##*/
