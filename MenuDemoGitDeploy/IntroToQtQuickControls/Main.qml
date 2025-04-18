import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window

    width: 640
    height: 800
    visible: true
    title: qsTr("Khlav Kalash Wagen")

    // disabling resizing of window with mouse drag
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height

    property real menuSectionsHeight: 400
    property real headerFooterOpacity: 0.6
    property real menuOpacity: 0.4

    palette: Palette{ // describes most things for whole code (!)
        window: "#2E3B4E"           // processing window color
        base: "#3B4F63"             // background and spinBox color
        text: "white"
        button: "#5A6A83"           // spinBox button color
        buttonText: "DarkGoldenRod" // spinBox +/- color
        highlight: "white"          // text marking color in spinBox
    }

    background: Image{
        source: Qt.resolvedUrl("images/khlav_kalash.jpg")
    }

    FontLoader {
        id: kalamFont
        source: Qt.resolvedUrl("fonts/Kalam-Regular.ttf")
    }

    font {
        family: kalamFont.font.family
        pixelSize: 18
    }

    header: Pane {

        padding: 10

        background: Rectangle {
            color: window.palette.base
            opacity: headerFooterOpacity
        }

        Label {
            text: "Fusion Wagon"
            font.pixelSize: 47
            anchors.centerIn: parent
            color: window.palette.text
        }
    }

    Item {
        id: menu

        readonly property real totalOrderCost: appetizers.subtotal +
                                               mains.subtotal +
                                               extras.subtotal +
                                               bakery.subtotal +
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
                opacity: menuOpacity
                anchors.fill: parent
            }

            ColumnLayout{
                anchors.fill: parent
                spacing: 10


                Item { // MenuSections in their own container
                    Layout.fillWidth: true
                    Layout.preferredHeight: menuSectionsHeight

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 8

                        MenuSection {
                            id: appetizers
                            title: qsTr("Appetizers")
                            Layout.fillWidth: true

                            item1 {
                                name: qsTr("Roasted Onions")
                                cost: 10
                            }
                            item2 {
                                name: qsTr("Bean Pie")
                                cost: 12
                            }
                            item3 {
                                name: qsTr("Brokkoli Wings")
                                cost: 9
                            }
                        }

                        MenuSection {
                            id: mains
                            title: qsTr("Mains")
                            Layout.fillWidth: true

                            item1 {
                                name: qsTr("Lamb Sticks")
                                cost: 26
                            }
                            item2 {
                                name: qsTr("Sea Bass")
                                cost: 25
                            }
                            item3 {
                                name: qsTr("Risotto")
                                cost: 22
                            }
                        }
                    }
                }


                Item { // separate space for spice dial
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    SpiceDial {
                        anchors.centerIn: parent
                        width: parent.width
                    }
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
                opacity: menuOpacity
                anchors.fill: parent
            }

            ColumnLayout{
                anchors.fill: parent
                spacing: 10

                // MenuSections in their own container with the same height as left side
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: menuSectionsHeight

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 8

                        MenuSection {
                            id: extras
                            title: qsTr("Extras")
                            Layout.fillWidth: true

                            item1 {
                                name: qsTr("Rosted Potatoes")
                                cost: 9
                            }
                            item2 {
                                name: qsTr("Green Beans")
                                cost: 7
                            }
                            item3 {
                                name: qsTr("Grilled Corn")
                                cost: 7
                            }
                        }

                        MenuSection {
                            id: bakery
                            title: qsTr("Bakery")
                            Layout.fillWidth: true

                            item1 {
                                name: qsTr("Sourdough Bread")
                                cost: 9
                            }
                            item2 {
                                name: qsTr("Garlic Bread")
                                cost: 10
                            }
                            item3 {
                                name: qsTr("Warm Focaccia")
                                cost: 11
                            }
                        }
                    }
                }


                Item { // remaining controls in their own container
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 2

                        Label {
                            id: diningOptionsLabel
                            Layout.fillWidth: true
                            font.pixelSize: 30
                            text: qsTr("Dining Options")
                            color: window.palette.text
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignHCenter
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
                            //Layout.alignment: Qt.AlignHCenter
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
                                horizontalAlignment: Text.AlignRight
                                font.pixelSize: 30
                                text: `$${tipSlider.value}`
                                color: window.palette.text
                            }
                        }
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

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            Label {
                text: qsTr("Order Processed!")
                color: window.palette.text
            }

            Label {
                id: tipMessage
                text: ""
                color: window.palette.text
            }
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
            opacity: headerFooterOpacity
        }

        RowLayout {
            anchors.fill: parent

            Label {
                id: orderTotal
                text: qsTr("Total Order Cost: $%1").arg(menu.totalOrderCost)
                font.pixelSize: 29
                Layout.fillWidth: true
                color: window.palette.text
            }

            Button {
                id: orderButton
                text: qsTr("Order Now")
                enabled: menu.totalOrderCost > 0 &&
                         (eatInRadioButton.checked || takeawayButton.checked)
                onClicked: {
                    orderProcessingTimer.restart()

                    if (tipSlider.value === 0) {
                        tipMessage.text = "You greedy person, no tip!";
                    } else if (tipSlider.value < 60) {
                        tipMessage.text = `Thanks for the $${tipSlider.value} tip!`;
                    } else {
                        tipMessage.text = "Wow, you're generous!";
                    }
                }
            }
        }
    }
}

