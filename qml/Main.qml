import QtQuick
import QtQuick.Layouts
import GameTimer

Window {
    id: root
    color: "#EEEEEE"
    width: 450
    height: 900
    visible: true
    title: qsTr("Game Timer")

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        LogoArea {
            Layout.preferredHeight: 3
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                color: "#c79bc7"
            }
        }

        ControlArea {
            Layout.preferredHeight: 4
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                color: "#d3b3d3"
            }
        }

        GameInfoArea {
            Layout.preferredHeight: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                color: "#c79bc7"
            }
        }

        PlayersView {
            Layout.preferredHeight: 6
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                color: "#d3b3d3"
            }
        }

        TurnsView {
            Layout.preferredHeight: 6
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                color: "#c79bc7"
            }
        }
    }
}
