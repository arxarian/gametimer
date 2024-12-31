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

        HeadItem {
            id: head
            onToggleScreens: stackLayout.currentIndex = 1 - stackLayout.currentIndex
            Layout.preferredHeight: parent.height * 0.12
            Layout.fillWidth: true
        }

        StackLayout {
            id: stackLayout
            // currentIndex: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            BodyItem {}

            TurnsView {}
        }

        FooterItem {
            id: footer
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.15
        }
    }
}
