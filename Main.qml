import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 800
    height: 450
    visible: true
    title: qsTr("Game Timer")

    ColumnLayout {
        anchors.fill: parent

        HeadItem {
            id: head
            Layout.preferredHeight: parent.height * 0.15
            Layout.fillWidth: true

            onNextPlayer: body.nextPlayer()
        }

        BodyItem {
            id: body
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 5
        }

        FooterItem {
            id: footer
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.15
            Layout.margins: 5
        }
    }
}
