import QtQuick
import QtQuick.Layouts
import GameTimer

Item {
    id: root

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                font.pixelSize: parent.height / 3
                text: qsTr("Total time %1").arg(GameData.elapsedTime)
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                font.pixelSize: parent.height / 3
                text: qsTr("Turn %1").arg(GameData.turn)
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
