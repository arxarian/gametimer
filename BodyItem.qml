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

        delegate: Item {
            height: view.height
            width: view.width / view.count

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
                        when: view.currentIndex === index
                        value: 1
                    }

                    Behavior on opacity {
                        OpacityAnimator {duration: 300}
                    }
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
