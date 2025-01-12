import QtQuick

Item {
    id: logoArea

    Image {
        anchors.fill: parent
        source: "qrc:/logo.png"
        fillMode: Image.PreserveAspectFit
    }
}
