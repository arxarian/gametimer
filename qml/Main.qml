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
        }

        ControlArea {
            Layout.preferredHeight: 4
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 0.35
                color: "purple"
            }
        }

        GameInfoArea {
            Layout.preferredHeight: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 0.5
                color: "purple"
            }
        }

        PlayersView {
            Layout.preferredHeight: 6
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 0.8
                color: "purple"
            }
        }

        TurnsView {
            Layout.preferredHeight: 6
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 1
                color: "purple"
            }
        }
    }
}
