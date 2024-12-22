import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    signal nextPlayer

    Button {
        text: "Next player"
        onClicked: root.nextPlayer()
    }
}
