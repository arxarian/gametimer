import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: body

    signal nextPlayer

    onNextPlayer: view.currentIndex = (view.currentIndex + 1) % view.count

    ListView {
        id: view
        anchors.fill: parent
        orientation: Qt.Horizontal
        interactive: false
        model: 5

        highlight: Component {
            Rectangle {
                width: 10
                height: 10
                color: "green"
            }
        }

        delegate: Item {
            height: view.height
            width: view.width / view.count

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    radius: 10
                    color: "gold"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: parent.width * 0.05
                }

                Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Player " + index

                    Layout.preferredHeight: parent.height * 0.1
                    Layout.fillWidth: true
                }
            }
        }
    }
}
