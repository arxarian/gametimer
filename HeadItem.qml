import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    Item {
        id: wrapper
        anchors.fill: parent

        ToolButton {
            icon.source: GameData.running ? "pause.png" : "play.png"
            icon.height: wrapper.height * 0.5
            icon.width: wrapper.height * 0.5
            onClicked: GameData.running = !GameData.running
        }

        ToolButton {
            visible: GameData.running
            anchors.horizontalCenter: parent.horizontalCenter
            // text: qsTr("Next\nplayer")
            icon.source: "next_player.png"
            icon.height: wrapper.height * 0.5
            icon.width: wrapper.height * 0.5
            // enabled: GameData.running
            onClicked: GameData.players.setNextPlayer()

            Binding on palette.buttonText {
                when: GameData.running
                value: "black"
            }
        }

        Row {
            anchors.right: parent.right
            height: parent.height
            visible: !GameData.running
            spacing: 5
            layoutDirection: Qt.RightToLeft

            // ToolButton {
            //     icon.source: "reset.png"
            //     icon.height: wrapper.height * 0.5
            //     icon.width: wrapper.height * 0.5
            // }

            ToolButton {
                icon.source: "minus.png"
                icon.height: wrapper.height * 0.5
                icon.width: wrapper.height * 0.5
                enabled: GameData.players.count > 1
                onClicked: GameData.players.removeLastPlayer()
            }

            ToolButton {
                icon.source: "plus.png"
                icon.height: wrapper.height * 0.5
                icon.width: wrapper.height * 0.5
                onClicked: GameData.players.appendPlayer()
            }
        }
    }
}
