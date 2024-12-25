import QtQuick
import QtQuick.Layouts
import GameTimer

Item {
    id: body

    ListView {
        id: view

        property int maxReachableTime: 120

        anchors.fill: parent
        orientation: Qt.Horizontal
        interactive: false
        model: GameData.players

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
                    color: "transparent"
                    // radius: 10
                    border.width: 1
                    border.color: Qt.darker("purple")

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.3
                    Layout.leftMargin: parent.width * 0.3

                    Rectangle {
                        anchors.bottom: parent.bottom
                        height: parent.height * item.player.elapsedTimeNumber / view.maxReachableTime
                        z: - 1

                        width: parent.width
                        // radius: 10
                        color: "purple"
                        opacity: 0.3

                        Behavior on height {
                            NumberAnimation {duration: 300}
                        }

                        Binding on opacity {
                            when: item.player.active
                            value: 1
                        }

                        Behavior on opacity {
                            OpacityAnimator {duration: 300}
                        }
                    }
                }

                Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("%1\n%2").arg(item.player.elapsedTime).arg(item.player.name)

                    Layout.preferredHeight: parent.height * 0.1
                    Layout.fillWidth: true
                }
            }
        }
    }
}
