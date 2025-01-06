import QtQuick

Item {
    id: logoArea
    
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
