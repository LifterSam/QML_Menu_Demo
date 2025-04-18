import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Controls.Material 2.15

Page{
    header: Pane {

        padding: 10

        background: Rectangle {
            color: window.palette.base
            opacity: 0.5
        }

        Label {
            text: "Khlav Kalash Wagen Menü"
            font.pixelSize: 30
            anchors.centerIn: parent
            color: window.palette.text
        }
    }

    Item {
        id: menu

        readonly property real totalOrderCost: starters.subtotal +
                                               mains.subtotal +
                                               sides.subtotal +
                                               breads.subtotal +
                                               tipSlider.value

        anchors.fill: parent

        Pane{
            anchors {
                left: parent.left
                right: parent.horizontalCenter
                top: parent.top
                bottom: parent.bottom
            }
            opacity: 1
            padding: 8

            background: Rectangle {
                color: window.palette.base
                opacity: 0.3
                anchors.fill: parent
            }


            ColumnLayout{ // triplet of left sided contents
                anchors.fill: parent

                MenuSection {

                    id: starters

                    title: qsTr("Starters")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Onion Bhaji")
                        cost: 10
                    }
                    item2 {
                        name: qsTr("Meat Samosa")
                        cost: 12
                    }
                    item3 {
                        name: qsTr("Nargis Kebab")
                        cost: 15
                    }
                }

                MenuSection {
                    id: mains

                    title: qsTr("Mains")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Paneer Tikka")
                        cost: 20
                    }
                    item2 {
                        name: qsTr("Lamb Bhuna")
                        cost: 25
                    }
                    item3 {
                        name: qsTr("Murgh Tikka")
                        cost: 28
                    }
                }

                SpiceDial{ // external QML component with logic for the dial
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        Pane{
            anchors {
                left: parent.horizontalCenter
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            opacity: 1
            padding: 8

            background: Rectangle {
                color: window.palette.base
                opacity: 0.3
                anchors.fill: parent
            }

            ColumnLayout{ // triplet of right sided contents
                anchors.fill: parent

                MenuSection {
                    id: sides

                    title: qsTr("Sides")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Onion Bhaji")
                        cost: 10
                    }
                    item2 {
                        name: qsTr("Meat Samosa")
                        cost: 12
                    }
                    item3 {
                        name: qsTr("Nargis Kebab")
                        cost: 15
                    }
                }

                MenuSection {
                    id: breads

                    title: qsTr("Breads")

                    Layout.fillWidth: true

                    item1 {
                        name: qsTr("Paneer Tikka")
                        cost: 20
                    }
                    item2 {
                        name: qsTr("Lamb Bhuna")
                        cost: 25
                    }
                    item3 {
                        name: qsTr("Murgh Tikka")
                        cost: 28
                    }
                }

                Label {
                    id: diningOptionsLabel

                    Layout.fillWidth: true
                    font.pixelSize: 30
                    text: qsTr("Dining Options")
                    color: window.palette.text
                }

                RowLayout {
                    RadioButton {
                        id: eatInRadioButton
                        text: qsTr("Eat In")

                        contentItem: Text {
                            text: eatInRadioButton.text
                            font: eatInRadioButton.font
                            color: window.palette.text
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: eatInRadioButton.indicator.width + eatInRadioButton.spacing
                        }
                    }
                    RadioButton {
                        id: takeawayButton
                        text: qsTr("Take away")

                        contentItem: Text {
                            text: takeawayButton.text
                            font: takeawayButton.font
                            color: window.palette.text
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: takeawayButton.indicator.width + takeawayButton.spacing
                        }
                    }
                }

                Label {
                    id: tipLabel

                    Layout.fillWidth: true
                    font.pixelSize: 30
                    text: qsTr("Tip Amount")
                    color: window.palette.text
                }

                RowLayout {

                    Slider {
                        id: tipSlider

                        Layout.fillWidth: false
                        Layout.preferredWidth: 200
                        from: 0
                        to: 100
                        stepSize: 10
                        snapMode: Slider.SnapAlways
                        Material.accent: window.palette.text
                        Material.background: "gray"
                    }

                    Label {
                        id: tipValue
                        font.pixelSize: 30
                        text: `$${tipSlider.value}`
                        color: window.palette.text
                    }
                }
            }
        }
    }


    Pane {
        id: orderProcessing

        visible: false
        anchors.centerIn: parent
        width: window.width / 2
        height: window.height / 3

        background: Rectangle {
            color: palette.window
            border.color: palette.windowText
        }

        ColumnLayout {
            anchors.centerIn: parent

            Label {
                id: orderStatus
                text: qsTr("Processing Order: $%1").arg(menu.totalOrderCost)
                Layout.alignment: Qt.AlignHCenter
                color: window.palette.text
            }
            BusyIndicator {
                running: visible
                Layout.alignment: Qt.AlignHCenter
                palette.dark: window.palette.text
            }
        }
    }

    Pane {
        id: orderProcessed

        visible: false
        anchors.centerIn: parent
        width: window.width / 2
        height: window.height / 3

        background: Rectangle {
            color: palette.window
            border.color: palette.windowText
        }

        Label {
            text: qsTr("Order Processed!")
            anchors.centerIn: parent
            color: window.palette.text
        }

        TapHandler {
            onTapped: orderProcessed.visible = false
        }
    }

    Timer {
        id: orderProcessingTimer
        interval: 2000
        repeat: false
        onRunningChanged: if(running) {
                              orderProcessing.visible = true
                          }

        onTriggered: {
            orderProcessing.visible = false
            orderProcessed.visible = true
        }
    }


    footer: Pane {

        padding: 10

        background: Rectangle {
            color: window.palette.base
            opacity: 0.5
        }

        RowLayout {
            anchors.fill: parent

            Label {
                id: orderTotal
                text: qsTr("Total Order Cost: $%1").arg(menu.totalOrderCost)
                font.pixelSize: 30
                Layout.fillWidth: true
                color: window.palette.text
            }

            Button {
                id: orderButton
                text: qsTr("Order Now")
                enabled: menu.totalOrderCost > 0 &&
                         (eatInRadioButton.checked || takeawayButton.checked)
                onClicked: orderProcessingTimer.restart()
            }
        }
    }
}

