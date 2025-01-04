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
        anchors.margins: 5
        spacing: 0

        Item {
            id: logoArea

            Layout.preferredHeight: parent.height * 0.15
            Layout.fillWidth: true

            Rectangle {
                anchors.fill: parent
                opacity: 0.25
                color: "purple"
            }

            Image {
                anchors.fill: parent
                source: "qrc:/logo.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Item {
            id: controlArea

            Layout.verticalStretchFactor: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                anchors.fill: parent
                opacity: 0.5
                color: "purple"
            }
        }

        PlayersItem {
            id: playersArea
            z: 1

            Layout.verticalStretchFactor: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 0.8
                color: "purple"
            }
        }

        TurnsItem {
            id: turnsArea

            Layout.verticalStretchFactor: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                z: -1
                anchors.fill: parent
                opacity: 1
                color: "purple"
            }
        }


        // HeadItem {
        //     id: head
        //     onToggleScreens: stackLayout.currentIndex = 1 - stackLayout.currentIndex
        //     Layout.preferredHeight: parent.height * 0.12
        //     Layout.fillWidth: true
        // }

        // StackLayout {
        //     id: stackLayout
        //     Layout.fillHeight: true
        //     Layout.fillWidth: true

        //     BodyItem {}

        //     TurnsView {}
        // }

        // FooterItem {
        //     id: footer
        //     Layout.fillWidth: true
        //     Layout.preferredHeight: parent.height * 0.15
        // }
    }
}
