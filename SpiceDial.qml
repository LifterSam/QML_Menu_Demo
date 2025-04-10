import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


Page{
    anchors.fill: parent
    background: null
    header: Label {
        text: "Spicyness"
        height: 40
        font.bold: true
        font.pixelSize: 29
        horizontalAlignment: Text.AlignLeft
        color: window.palette.text
    }

    RowLayout{ // pictures and dial horizontal layout
        anchors.left: parent.left
        anchors.leftMargin: 30

        Image {
            horizontalAlignment: Image.AlignHCenter
            source: Qt.resolvedUrl("images/spice_level1.png")
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignBottom
        }

        Dial {
            Layout.preferredWidth: 150
            Layout.preferredHeight: 150
            id: dial
            width: 150
            from: 0
            to: 100
            stepSize: 5
            snapMode: Dial.SnapAlways
            value: 10
            palette.dark: "white"
        }

        Image {
            source: Qt.resolvedUrl("images/spice_level3.png")
            Layout.preferredWidth: 50
            Layout.preferredHeight: 50
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignBottom
        }
    }
}
