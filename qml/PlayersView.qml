import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import GameTimer

Item {
    id: body

    ListView {
        id: view

        property int maxReachableTime: 60

        anchors.fill: parent
        anchors.margins: 5
        orientation: Qt.Horizontal
        interactive: false
        model: GameData.players
        currentIndex: GameData.players.currentPlayerIndex

        delegate: Item {
            id: item
            height: view.height
            width: view.width / view.count

            property PlayerItem player: model.object

            Connections {
                target: item.player
                function onElapsedTimeNumberChanged() {
                    if (item.player.elapsedTimeNumber > view.maxReachableTime) {
                        view.maxReachableTime = view.maxReachableTime * 1.5
                    }
                }
            }

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    color: "#EEEEEE"
                    border.width: 1
                    border.color: Qt.darker("purple")

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.rightMargin: parent.width * 0.3
                    Layout.leftMargin: parent.width * 0.3

                    MouseArea {
                        anchors.fill: parent
                        onClicked: item.player.alive = !item.player.alive
                    }

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
                        height: parent.height * (item.player ? item.player.elapsedTimeNumber : 0) / view.maxReachableTime
                        z: - 1

                        width: parent.width
                        color: item.player && item.player.alive ? "purple" : "gray"
                        opacity: 0.3

                        Behavior on height {
                            NumberAnimation {duration: 300}
                        }

                        Binding on opacity {
                            when: item.player && item.player.active
                            value: 1
                        }

                        Behavior on opacity {
                            OpacityAnimator {duration: 300}
                        }
                    }
                }

                Text {
                    id: text
                    property int playerTime: item.player ? item.player.elapsedTime : 0
                    property string playerName: item.player ? item.player.name : "undefined"

                    font.pixelSize: height / 2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("%1\n%2").arg(text.playerTime).arg(text.playerName)

                    Layout.preferredHeight: parent.height * 0.1
                    Layout.fillWidth: true

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
        }
    }
}
