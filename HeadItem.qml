import QtQuick
import QtQuick.Controls
import GameTimer

Item {
    id: root

    Button {
        text: qsTr("Next player")
        onClicked: GameData.players.nextPlayer()
    }
}
