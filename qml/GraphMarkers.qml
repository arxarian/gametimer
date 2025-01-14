import QtQuick
import QtQuick.Controls

import GameTimer

Item {
    id: root

    property int maxReachableTime: 60
    property color markerColor: "#aaaaaa"

    z: -1

    Rectangle {
        id: topMarker
        z: -1
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 40
        height: 1
        color: root.markerColor
    }
    
    Label {
        text: GameData.formatTime(root.maxReachableTime) // TODO - what about 99:59:59; 59:59 is okay
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        anchors.verticalCenter: topMarker.verticalCenter
        anchors.verticalCenterOffset: -2
        anchors.right: parent.left
        anchors.rightMargin: -parent.width * 0.04
        height: parent.height * 0.12
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }
    
    Rectangle {
        id: middleMarker
        z: -1
        anchors.centerIn: parent
        width: parent.width - 40
        height: 1
        color: root.markerColor
    }
    
    Label {
        text: GameData.formatTime(root.maxReachableTime / 2)
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        anchors.verticalCenter: middleMarker.verticalCenter
        anchors.verticalCenterOffset: -2
        anchors.right: parent.left
        anchors.rightMargin: -parent.width * 0.04
        height: parent.height * 0.12
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }
    
    Rectangle {
        id: bottomMarker
        z: -1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        width: parent.width - 40
        height: 1
        color: root.markerColor
    }
    
    Label {
        text: "0"
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignRight
        anchors.verticalCenter: bottomMarker.verticalCenter
        anchors.verticalCenterOffset: -2
        anchors.right: parent.left
        anchors.rightMargin: -parent.width * 0.04
        height: parent.height * 0.12
        width: parent.width * 0.075
        font.pixelSize: height / 2
    }
}
