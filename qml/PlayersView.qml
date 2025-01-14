import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import GameTimer

Item {
    id: root

    ListView {
        id: view

        property int maxReachableTime: 60

        anchors.fill: parent
        anchors.rightMargin: 5
        anchors.topMargin: parent.height * 0.04
        anchors.leftMargin: parent.width * 0.04
        anchors.bottomMargin: parent.height * 0.08

        orientation: Qt.Horizontal
        interactive: false
        model: GameData.players
        currentIndex: GameData.players.currentPlayerIndex

        delegate: Item {
            id: item

            property PlayerItem player: model.object

            height: view.height
            width: view.width / view.count

            Connections {
                target: item.player
                function onElapsedTimeChanged() {
                    if (item.player.elapsedTime > view.maxReachableTime) {
                        view.maxReachableTime = view.maxReachableTime * 1.5
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                anchors.rightMargin: parent.width * 0.3
                anchors.leftMargin: parent.width * 0.3

                enabled: GameData.running
                onClicked: item.player.alive = !item.player.alive

                Image {
                    visible: item.player ? !item.player.alive : false
                    anchors.centerIn: parent
                    height: parent.height
                    width: parent.width * 0.7
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/skeleton.png"
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    height: parent.height * (item.player ? item.player.elapsedTime : 0)/ view.maxReachableTime

                    width: parent.width
                    color: item.player && item.player.alive ? "#cb6bcb" : "#b29fb2"

                    Behavior on height {
                        NumberAnimation {duration: 300}
                    }

                    Binding on color {
                        when: item.player && item.player.active
                        value: "#c636c6"
                    }
                }
            }

            Label {
                id: text

                property string playerName: item.player ? item.player.name : "undefined"

                anchors.top: parent.bottom
                anchors.topMargin: -2

                height: parent.height * 0.1 + 2
                width: parent.width

                font.pixelSize: height / 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("%1").arg(text.playerName)

                EnterNameDialog {
                    id: nameDialog
                    anchors.fill: parent

                    title: qsTr("Change player name")
                    placeholderText: item.player ? item.player.name : ""

                    onAccepted: {
                        if (nameDialog.text) {
                            item.player.name = nameDialog.text
                        }
                    }
                }
            }
        }

        GraphMarkers {
            anchors.fill: parent
            maxReachableTime: view.maxReachableTime
        }
    }
}
