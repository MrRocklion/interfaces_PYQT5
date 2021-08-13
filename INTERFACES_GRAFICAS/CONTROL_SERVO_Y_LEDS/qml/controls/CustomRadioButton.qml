import QtQuick 2.15
import QtQuick.Controls 2.12

RadioButton {
    id: control
    text: qsTr("RadioButton")
    checked: true
    property color radioActiveColor: "#21be2b"
    property color radioPressColor: "#17a81a"
    property color textColor: "white"
    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        border.color: control.down ? control.radioPressColor : control.radioActiveColor
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 7
            color: control.down ? control.radioPressColor : control.radioActiveColor
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.textColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:28;width:110}
}
##^##*/
