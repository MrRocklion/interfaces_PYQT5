
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

T.Dial {
    id: control
    property color colorDial: "#55aaff"
    property color colorDial2: "#55aaff"
    property color colorArrow: "#ffffff"
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding) || 184 // ### remove 184 in Qt 6
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding) || 184 // ### remove 184 in Qt 6

    background: DialImpl {
        implicitWidth: 184
        implicitHeight: 184
        color: control.visualFocus ? control.colorDial: control.colorDial2
        progress: control.position
        opacity: control.enabled ? 1 : 0.3
    }

    handle: ColorImage {
        x: control.background.x + control.background.width / 2 - control.handle.width / 2
        y: control.background.y + control.background.height / 2 - control.handle.height / 2
        width: 14
        height: 10
        defaultColor: "#55aaff"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/images/dial-indicator.png"
        antialiasing: true
        opacity: control.enabled ? 1 : 0.3
        color: control.colorArrow
        transform: [
            Translate {
                y: -Math.min(control.background.width, control.background.height) * 0.4 + control.handle.height / 2
            },
            Rotation {
                angle: control.angle
                origin.x: control.handle.width / 2
                origin.y: control.handle.height / 2
            }
        ]
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
