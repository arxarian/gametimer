import QtQuick
import QtQuick.Controls
import GameTimer

Item {
    id: root

    Button {
        text: "Next player"
        onClicked: ApplicationData.players.nextPlayer()
    }
}
