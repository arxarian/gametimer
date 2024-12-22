import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                text: qsTr("Total time %1").arg(new Date().toTimeString())
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                anchors.fill: parent
                text: qsTr("Turn %1").arg(5)
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter

            }
        }
    }
}
