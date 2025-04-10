import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

RowLayout {
    id: root

    property string name
    property real cost: 0
    readonly property real value: spinBox.value * cost

    Label {
        id: label
        text: `${root.name}: $${root.cost}`
        Layout.fillWidth: true
        font.pixelSize: 18
        color: window.palette.text
    }

    SpinBox {
        id: spinBox
        editable: true
        opacity: 0.7
    }
}
