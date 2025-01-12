import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import GameTimer

Item {
    id: body

    Label {
        text: view.maxReachableTime
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        height: parent.height * 0.1
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }

    Label {
        text: view.maxReachableTime / 2
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.5 + 1
        height: parent.height * 0.1
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }

    Label {
        text: "0"
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.075
        height: parent.height * 0.1
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }


    ListView {
        id: view

        property int maxReachableTime: 60

        anchors.fill: parent
        anchors.topMargin: parent.height * 0.05 + 1
        anchors.leftMargin: parent.width * 0.04
        orientation: Qt.Horizontal
        interactive: false
        model: GameData.players
        currentIndex: GameData.players.currentPlayerIndex

        Rectangle {
            z: -1
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40
            height: 1
            color: "#aaaaaa"
        }

        Rectangle {
            z: -1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.55 + 7
            width: parent.width - 40
            height: 1
            color: "#aaaaaa"
        }

        Rectangle {
            z: -1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1 + 5
            width: parent.width - 40
            height: 1
            color: "#aaaaaa"
        }

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

                MouseArea {
                    enabled: GameData.running
                    onClicked: item.player.alive = !item.player.alive

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.rightMargin: parent.width * 0.3
                    Layout.leftMargin: parent.width * 0.3

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
                        height: parent.height * (item.player ? item.player.elapsedTimeNumber : 0)/ view.maxReachableTime

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

                Text {
                    id: text

                    property string playerTime: item.player ? item.player.elapsedTime : 0
                    property string playerName: item.player ? item.player.name : "undefined"

                    font.pixelSize: height / 2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("%1").arg(text.playerName)

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
