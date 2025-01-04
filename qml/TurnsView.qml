import QtQuick
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    ListView {
        id: view

        property int maxReachableTime: 60

        anchors.fill: parent
        anchors.margins: 5
        clip: true

        orientation: Qt.Horizontal
        model: GameData.turns
        spacing: 5
        currentIndex: view.count - 1

        delegate: Item {
            id: item

            property TurnItem turn: model.object

            width: 15
            height: view.height - text.contentHeight - 10

            Connections {
                target: item.turn
                function onTimeChanged() {
                    if (item.turn.time > view.maxReachableTime) {
                        view.maxReachableTime = view.maxReachableTime * 1.5
                    }
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height * (item.turn ? item.turn.time : 0) / view.maxReachableTime
                color: "#EEEEEE"

                Behavior on height {
                    NumberAnimation {duration: 300}
                }
            }

            Text {
                id: text
                anchors.topMargin: 5
                anchors.top: parent.bottom
                width: parent.width
                visible: (index === 0 || (index + 1) % 5 === 0)
                text: index + 1
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
