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
            id: newGamePane

            Column {
                anchors.centerIn: parent
                height: parent.height * 0.75
                width: parent.width

                MenuButton {
                    text: "Start"
                    height: parent.height * 0.33
                    width: parent.width
                    onClicked: GameData.start()
                }

                MenuLabel {
                    text: "Players"
                    height: parent.height * 0.33
                    width: parent.width
                }

                Item {
                    height: parent.height * 0.33
                    width: parent.width

                    MenuButton {
                        anchors.right: playerCountLabel.left
                        height: parent.height
                        width: parent.width * 0.075
                        text: "-"
                        onClicked: GameData.players.removeLastPlayer()
                    }

                    MenuLabel {
                        id: playerCountLabel
                        text: GameData.players.count
                        anchors.centerIn: parent
                        height: parent.height
                        width: parent.width * 0.10
                    }

                    MenuButton {
                        text: "+"
                        anchors.left: playerCountLabel.right
                        height: parent.height
                        width: parent.width * 0.075
                        onClicked: GameData.players.appendPlayer()
                    }
                }
            }
        }

        Item {
            id: stoppedGamePane

            Column {
                anchors.centerIn: parent
                height: parent.height * 0.5
                width: parent.width

                MenuButton {
                    text: "Continue"
                    height: parent.height * 0.5
                    width: parent.width
                    onClicked: GameData.start()
                }

                MenuButton {
                    text: "End"
                    height: parent.height * 0.5
                    width: parent.width
                    onClicked: GameData.end()
                }
            }
        }

        Item {
            id: runningGamePane

            Item {
                anchors.fill: parent

                Column {
                    anchors.fill: parent

                    Item {
                        id: playerInfo

                        property PlayerItem currentPlayer: GameData.players.currentPlayer

                        height: parent.height * 0.35
                        width: parent.width

                        Label {
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            height: parent.height * 0.6
                            width: parent.width * 0.5
                            text: playerInfo.currentPlayer.name
                            font.bold: true
                            font.pixelSize: height * 0.75
                        }

                        Label {
                            anchors.top: parent.top
                            anchors.topMargin: 5
                            anchors.rightMargin: 20
                            anchors.right: parent.right
                            height: parent.height * 0.6
                            width: parent.width * 0.5
                            text: GameData.formatTime(playerInfo.currentPlayer.elapsedTime)
                            horizontalAlignment: Text.AlignRight
                            font.bold: true
                            font.pixelSize: height * 0.75
                        }
                    }

                    Row {
                        width: parent.width
                        height: parent.height * 0.5

                        ToolButton {
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width * 0.25
                            icon.source: "qrc:/stop.png"
                            icon.height: parent.height * 0.5
                            icon.width: parent.height * 0.5
                            onClicked: GameData.stop()
                        }

                        ToolButton {
                            height: parent.height
                            width: parent.width * 0.5
                            icon.source: "qrc:/next_player.png"
                            icon.height: parent.height
                            icon.width: parent.height
                            onClicked: {
                                if (GameData.paused) {
                                    GameData.resume()
                                }

                                GameData.players.setNextPlayer()
                            }
                        }

                        ToolButton {
                            anchors.verticalCenter: parent.verticalCenter
                            width: parent.width * 0.25
                            icon.source: GameData.paused ? "qrc:/play.png" : "qrc:/pause.png"
                            icon.height: parent.height * 0.5
                            icon.width: parent.height * 0.5
                            onClicked: GameData.paused ? GameData.resume() : GameData.pause()
                        }
                    }
                }
            }
        }
    }
}
