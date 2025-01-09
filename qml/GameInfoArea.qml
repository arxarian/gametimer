import QtQuick
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 15
        anchors.rightMargin: 15

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                font.pixelSize: parent.height / 2
                text: qsTr("Game time %1").arg(GameData.elapsedTime)
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                font.pixelSize: parent.height / 2
                text: qsTr("Turn %1").arg(GameData.turn)
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
