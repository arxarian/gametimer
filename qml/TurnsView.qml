import QtQuick
import QtQuick.Controls

import GameTimer

Item {
    id: root

    Item {
        anchors.fill: parent
        anchors.rightMargin: 5
        anchors.topMargin: parent.height * 0.04
        anchors.leftMargin: parent.width * 0.04
        anchors.bottomMargin: parent.height * 0.08

        ListView {
            id: view

            property int maxReachableTime: 60

            anchors.fill: parent
            anchors.leftMargin: parent.width * 0.06
            anchors.rightMargin: parent.width * 0.02

            orientation: Qt.Horizontal
            model: GameData.turns
            spacing: 5
            currentIndex: view.count - 1

            delegate: Item {
                id: item

                property TurnItem turn: model.object

                height: view.height
                width: 14

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
                    color: GameData.turn - 1 === index ? "#b231b2" : "#c354c3"

                    Behavior on height {
                        NumberAnimation {duration: 300}
                    }
                }

                Label {
                    id: text

                    anchors.top: parent.bottom
                    anchors.topMargin: -2

                    width: parent.width
                    height: parent.height * 0.1 + 2

                    font.pixelSize: height / 2
                    visible: (index === 0 || (index + 1) % 5 === 0)
                    text: index + 1
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        GraphMarkers {
            anchors.fill: parent
            maxReachableTime: view.maxReachableTime
            markerColor: "#999999"
        }
    }
}
