import QtQuick 2.15
import QtQuick.Controls 2.12


CheckBox {
    id: control
    text: qsTr("CheckBox")
    checked: true
    property color backColor: "#17a81a"
    property color frontColor: "#21be2b"
    property color textColor: "#ffffff"
    indicator: Rectangle {
        implicitWidth: 26
        implicitHeight: 26
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: control.down ? control.backColor : control.frontColor

        Rectangle {
            width: 14
            height: 14
            x: 6
            y: 6
            radius: 2
            color: control.down ? control.backColor : control.frontColor
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        anchors.verticalCenter: parent.verticalCenter
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.textColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;height:30;width:90}
}
##^##*/
