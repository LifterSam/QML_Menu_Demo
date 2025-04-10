import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {
    id: root

    property alias item1: item1
    property alias item2: item2
    property alias item3: item3
    readonly property real subtotal: item1.value + item2.value + item3.value

    header: Label {
        id: title
        text: root.title
        font.pixelSize: 29
        color: window.palette.text
    }

    padding: 0
    spacing: 8
    background: null

    ColumnLayout {
        anchors.fill: parent

        MenuItemAndPrice {
            id: item1
        }

        MenuItemAndPrice {
            id: item2
        }

        MenuItemAndPrice {
            id: item3
        }
    }
}
