import QtQuick 2.6
import Sailfish.Silica 1.0
import "components/"

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2
    ListModel {
        id: pagesModel

        ListElement {
            pin: qsTr("PIN 1")
            col: qsTr("RED")
            title: qsTr("Red video")
            description: qsTr("Red video")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("GREEN")
            title: qsTr("Green video")
            description: qsTr("Green video")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("BLUE")
            title: qsTr("Blue video")
            description: qsTr("Blue video")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("ID2/RES")
            title: qsTr("ID bit 2")
            description: qsTr("ID bit 2, reserved")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("GND")
            title: qsTr("Ground, Hsync")
            description: qsTr("Ground, Hsync")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("RED_RTN")
            title: qsTr("Red return")
            description: qsTr("Red return")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("GREEN_RTN")
            title: qsTr("Green return")
            description: qsTr("Green return")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("BLUE_RTN")
            title: qsTr("Blue return")
            description: qsTr("Blue return")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("KEY/PWR")
            title: qsTr("Key / +5V")
            description: qsTr("formerly Key, now +5V")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("GND")
            title: qsTr("Ground, Vsync DDC")
            description: qsTr("Ground, Vsync DDC")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("ID0/RES")
            title: qsTr("Monitor ID bit 0")
            description: qsTr("formerly Monitor ID bit 0, reserved since E-DDC")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("ID1/SDA")
            title: qsTr("Monitor ID bit 1")
            description: qsTr("formerly Monitor ID bit 1, I²C since DDC2")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("HSYNC")
            title: qsTr("Horizontal sync")
            description: qsTr("Horizontal sync")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("VSYNC")
            title: qsTr("Vertical sync")
            description: qsTr("Vertical sync")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("ID3/SCL")
            title: qsTr("ID bit 3, I²C")
            description: qsTr("formerly Monitor ID bit 3, I²C clock since DDC2")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("VGA pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Male (DE-15/HD-15)")
                visible: isPortrait
            }

            HighlightImage {
                id: img1
                visible: isPortrait
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/vga_male.png"
                color: Theme.primaryColor
                width: 250 * resScale
                height: 200 * resScale
            }

            SectionHeader {
                text: qsTr("Female (DE-15/HD-15)")
                visible: isPortrait
            }

            SectionHeader {
                text: qsTr("Male + Female (DE-15/HD-15)")
                visible: isLandscape
            }

            HighlightImage {
                id: img2
                visible: isPortrait
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/vga_female.png"
                color: Theme.primaryColor
                width: 250 * resScale
                height: 200 * resScale
            }
            Row {
                visible: isLandscape
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                HighlightImage {
                    fillMode: Image.PreserveAspectFit
                    source: "../img/vga_male.png"
                    color: Theme.primaryColor
                    width: 250 * resScale
                    height: 200 * resScale
                }
                Rectangle {
                    color: "transparent"
                    width: Theme.paddingLarge * 4
                    height: width
                }
                HighlightImage {
                    fillMode: Image.PreserveAspectFit
                    source: "../img/vga_female.png"
                    color: Theme.primaryColor
                    width: 250 * resScale
                    height: 200 * resScale
                }
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            VerticalScrollDecorator {}

            TextMetrics {
                id: textMetrics
                text: pagesModel.get(pagesModel.count - 1).pin
                font.pixelSize: Theme.fontSizeExtraSmall
                font.family: Theme.fontFamily
            }

            PinsDetails {
                model: pagesModel
                pinTextMaxWidth: textMetrics.width
            }
        }
    }
}
