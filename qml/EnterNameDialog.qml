import QtQuick
import QtQuick.Controls

MouseArea {
    id: root

    signal accepted()

    property alias title: inputDialog.title
    property alias placeholderText: textField.placeholderText
    property alias text: textField.text

    onClicked: inputDialog.open()

    Dialog {
        id: inputDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: Overlay.overlay

        focus: true
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: root.accepted()

        TextField {
            id: textField
            focus: true
            width: parent.width
        }
    }
}
