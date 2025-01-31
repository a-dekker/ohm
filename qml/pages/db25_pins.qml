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
            title: qsTr("Shield")
            description: qsTr("Shield Ground")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("BLUE")
            title: qsTr("TXD")
            description: qsTr("Transmit Data")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("ID2/RES")
            title: qsTr("RXD")
            description: qsTr("Receive Data")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("GREEN_RTN")
            title: qsTr("RTS")
            description: qsTr("Request to Send")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("BLUE_RTN")
            title: qsTr("CTS")
            description: qsTr("Clear to Send")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("RED_RTN")
            title: qsTr("DSR")
            description: qsTr("Data Set Ready")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("YELLOW")
            title: qsTr("GND")
            description: qsTr("System Ground")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("GND")
            title: qsTr("CD")
            description: qsTr("Carrier Detect")
        }
        ListElement {
            pin: qsTr("PIN 20")
            col: qsTr("GREEN")
            title: qsTr("DTR")
            description: qsTr("Data Terminal Ready")
        }
        ListElement {
            pin: qsTr("PIN 22")
            col: qsTr("KEY/PWR")
            title: qsTr("RI")
            description: qsTr("Ring Indicator")
        }
    }

    ListModel {
        id: pagesModel2

        ListElement {
            pin: qsTr("PIN 1")
            col: qsTr("Out")
            title: qsTr("Strobe")
            description: qsTr("Control-0")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("In/Out")
            title: qsTr("Data0")
            description: qsTr("Data Bit 0")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("In/Out")
            title: qsTr("Data1")
            description: qsTr("Data Bit 1")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("In/Out")
            title: qsTr("Data2")
            description: qsTr("Data Bit 2")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("In/Out")
            title: qsTr("Data3")
            description: qsTr("Data Bit 3")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("In/Out")
            title: qsTr("Data4")
            description: qsTr("Data Bit 4")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("In/Out")
            title: qsTr("Data5")
            description: qsTr("Data Bit 5")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("In/Out")
            title: qsTr("Data6")
            description: qsTr("Data Bit 6")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("In/Out")
            title: qsTr("Data7")
            description: qsTr("Data Bit 7")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("In")
            title: qsTr("Ack")
            description: qsTr("Status-6")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("In")
            title: qsTr("Busy")
            description: qsTr("Status-7")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("In")
            title: qsTr("Paper-Out")
            description: qsTr("Status-5")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("In")
            title: qsTr("Select")
            description: qsTr("Status-4")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("Out")
            title: qsTr("Linefeed")
            description: qsTr("Control-1")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("In")
            title: qsTr("Error")
            description: qsTr("Status-3")
        }
        ListElement {
            pin: qsTr("PIN 16")
            col: qsTr("Out")
            title: qsTr("Initialize")
            description: qsTr("Control-2")
        }
        ListElement {
            pin: qsTr("PIN 17")
            col: qsTr("Out")
            title: qsTr("Select-Printer")
            description: qsTr("Control-3")
        }
        ListElement {
            pin: qsTr("PIN 18")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 0 Return")
        }
        ListElement {
            pin: qsTr("PIN 19")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 1 Return")
        }
        ListElement {
            pin: qsTr("PIN 20")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 2 Return")
        }
        ListElement {
            pin: qsTr("PIN 21")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 3 Return")
        }
        ListElement {
            pin: qsTr("PIN 22")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 4 Return")
        }
        ListElement {
            pin: qsTr("PIN 23")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 5 Return")
        }
        ListElement {
            pin: qsTr("PIN 24")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 6 Return")
        }
        ListElement {
            pin: qsTr("PIN 25")
            col: qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 7 Return")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("DB25 pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }
            SectionHeader {
                text: qsTr("Male")
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
                source: "../img/SubD25_male.png"
                color: Theme.primaryColor
                width: 350 * resScale
                height: 200 * resScale
            }
            SectionHeader {
                text: qsTr("Female")
                visible: isPortrait
            }
            SectionHeader {
                text: qsTr("Male + Female")
                visible: isLandscape
            }
            HighlightImage {
                id: img2
                visible: isPortrait
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 0
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/SubD25_female.png"
                color: Theme.primaryColor
                width: 350 * resScale
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
                    visible: isLandscape
                    fillMode: Image.PreserveAspectFit
                    source: "../img/SubD25_male.png"
                    color: Theme.primaryColor
                    width: 350 * resScale
                    height: 200 * resScale
                }
                Rectangle {
                    color: "transparent"
                    width: Theme.paddingLarge * 4
                    height: width
                }
                HighlightImage {
                    visible: isLandscape
                    fillMode: Image.PreserveAspectFit
                    source: "../img/SubD25_female.png"
                    color: Theme.primaryColor
                    width: 350 * resScale
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

            SectionHeader {
                text: qsTr("Serial/RS232")
            }

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

            SectionHeader {
                text: qsTr("Parallel")
            }

            PinsDetails {
                model: pagesModel2
                pinTextMaxWidth: textMetrics.width
            }
        }
    }
}
