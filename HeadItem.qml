import QtQuick
import QtQuick.Controls
import GameTimer

Item {
    id: root

    Row {
        Button {
            text: qsTr("Next player")
            enabled: GameData.running
            onClicked: GameData.players.nextPlayer()
        }
        Button {
            text: GameData.running ? qsTr("Pause") : qsTr("Continue")
            onClicked: GameData.running = !GameData.running
        }
    }
}
