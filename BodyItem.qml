import QtQuick
import QtQuick.Layouts
import GameTimer

Item {
    id: body

    ListView {
        id: view
        anchors.fill: parent
        orientation: Qt.Horizontal
        interactive: false
        model: GameData.players

        delegate: Item {
            id: item
            height: view.height
            width: view.width / view.count

            property PlayerItem player: model.object

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    radius: 10
                    color: "purple"
                    opacity: 0.3
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.3
                    Layout.leftMargin: parent.width * 0.3

                    Binding on opacity {
                        when: item.player.active
                        value: 1
                    }

                    Behavior on opacity {
                        OpacityAnimator {duration: 300}
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
