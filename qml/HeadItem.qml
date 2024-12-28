import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    signal toggleScreens

    Item {
        id: wrapper
        anchors.fill: parent

        ToolButton {
            icon.source: GameData.running ? "qrc:/pause.png" : "qrc:/play.png"
            icon.height: wrapper.height * 0.5
            icon.width: wrapper.height * 0.5
            onClicked: GameData.running = !GameData.running
        }

        ToolButton {
            visible: GameData.running
            anchors.horizontalCenter: parent.horizontalCenter
            // text: qsTr("Next\nplayer")
            icon.source: "qrc:/next_player.png"
            icon.height: wrapper.height * 0.5
            icon.width: wrapper.height * 0.5
            // enabled: GameData.running
            onClicked: GameData.players.setNextPlayer()

            Binding on palette.buttonText {
                when: GameData.running
                value: "black"
            }
        }

        ToolButton {
            anchors.right: parent.right
            visible: GameData.running
            icon.source: "qrc:/graph.png"
            icon.height: wrapper.height * 0.5
            icon.width: wrapper.height * 0.5
            onClicked: root.toggleScreens()
        }

        Row {
            anchors.right: parent.right
            height: parent.height
            visible: !GameData.running
            spacing: 5
            layoutDirection: Qt.RightToLeft

            ToolButton {
                icon.source: "qrc:/reset.png"
                icon.height: wrapper.height * 0.5
                icon.width: wrapper.height * 0.5
                onClicked: GameData.reset()
            }

            ToolButton {
                icon.source: "qrc:/minus.png"
                icon.height: wrapper.height * 0.5
                icon.width: wrapper.height * 0.5
                enabled: GameData.players.count > 1
                onClicked: GameData.players.removeLastPlayer()
            }

            ToolButton {
                icon.source: "qrc:/plus.png"
                icon.height: wrapper.height * 0.5
                icon.width: wrapper.height * 0.5
                onClicked: GameData.players.appendPlayer()
            }
        }
    }
}
