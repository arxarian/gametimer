import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    StackLayout {
        id: controlPaneStackLayout
        anchors.fill: parent
        currentIndex: GameData.controlPaneIndex

        Item {
            Column {
                id: newGamePane
                anchors.centerIn: parent
                height: parent.height * 0.75
                width: parent.width

                ToolButton {
                    text: "Start"
                    height: parent.height * 0.33
                    width: parent.width
                    font.pixelSize: height * 0.75
                    onClicked: GameData.start()
                }

                Label {
                    text: "Players"
                    height: parent.height * 0.33
                    width: parent.width
                    font.pixelSize: height * 0.75
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                Item {
                    height: parent.height * 0.33
                    width: parent.width

                    ToolButton {
                        text: "+"
                        anchors.right: playerCountLabel.left
                        height: parent.height
                        width: parent.width * 0.075
                        font.pixelSize: height * 0.75
                        onClicked: GameData.players.appendPlayer()
                    }

                    Label {
                        id: playerCountLabel
                        text: GameData.players.count
                        anchors.centerIn: parent
                        height: parent.height
                        width: parent.width * 0.10
                        font.pixelSize: height * 0.75
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    ToolButton {
                        text: "-"
                        anchors.left: playerCountLabel.right
                        height: parent.height
                        width: parent.width * 0.075
                        font.pixelSize: height * 0.75
                        onClicked: GameData.players.removeLastPlayer()
                    }
                }
            }
        }

        Item {
            id: stoppedGamePane
        }

        Item {
            id: runningGamePane

            Row {
                anchors.fill: parent

                ToolButton {
                    icon.source: GameData.running ? "qrc:/pause.png" : "qrc:/play.png"
                    icon.height: parent.height * 0.5
                    icon.width: parent.height * 0.5
                    onClicked: GameData.running = !GameData.running
                }

                ToolButton {
                    // text: qsTr("Next\nplayer")
                    icon.source: "qrc:/next_player.png"
                    icon.height: parent.height * 0.5
                    icon.width: parent.height * 0.5
                    onClicked: GameData.players.setNextPlayer()
                }
            }
        }
    }
}
