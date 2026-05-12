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
            col: qsTr("Orange")
            title: qsTr("+3.3V")
            description: qsTr("+3.3 VDC")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("Orange")
            title: qsTr("+3.3V")
            description: qsTr("+3.3 VDC")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("Red")
            title: qsTr("+5V")
            description: qsTr("Power for legacy peripherals (e.g. HDDs, optical drives)")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("Red")
            title: qsTr("+5V")
            description: qsTr("Redundant +5V supply")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("Grey")
            title: qsTr("Power Good (PG)")
            description: qsTr("Indicates stable voltages (sent after PSU self-tests)")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("Purple")
            title: qsTr("+5VSB")
            description: qsTr("Standby power for wake-on-LAN and USB charging (active even when the PC is off)")
        }
        ListElement {
            pin: qsTr("PIN 10")
            col: qsTr("Yellow")
            title: qsTr("+12V")
            description: qsTr("Primary power for CPU and GPU")
        }
        ListElement {
            pin: qsTr("PIN 11")
            col: qsTr("Yellow")
            title: qsTr("+12V")
            description: qsTr("Redundant +12V supply")
        }
        ListElement {
            pin: qsTr("PIN 12")
            col: qsTr("Orange")
            title: qsTr("+3.3V")
            description: qsTr("Power for PCIe slots and memory")
        }
        ListElement {
            pin: qsTr("PIN 13")
            col: qsTr("Orange")
            title: qsTr("+3.3V")
            description: qsTr("Redundant +3.3V supply")
        }
        ListElement {
            pin: qsTr("PIN 14")
            col: qsTr("Blue")
            title: qsTr("-12V")
            description: qsTr("Legacy support for serial ports (rarely used today)")
        }
        ListElement {
            pin: qsTr("PIN 15")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 16")
            col: qsTr("Green")
            title: qsTr("PS-ON#")
            description: qsTr("Power-on signal (low to activate PSU)")
        }
        ListElement {
            pin: qsTr("PIN 17")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 18")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 19")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
        ListElement {
            pin: qsTr("PIN 20")
            col: qsTr("White")
            title: qsTr("NC")
            description: qsTr("-5V Not Connected (removed in newer ATX versions)")
        }
        ListElement {
            pin: qsTr("PIN 21")
            col: qsTr("Red")
            title: qsTr("+5V")
            description: qsTr("Power for PCIe slots and peripherals")
        }
        ListElement {
            pin: qsTr("PIN 22")
            col: qsTr("Red")
            title: qsTr("+5V")
            description: qsTr("Redundant +5V supply")
        }
        ListElement {
            pin: qsTr("PIN 23")
            col: qsTr("Red")
            title: qsTr("+5V")
            description: qsTr("Redundant +5V supply")
        }
        ListElement {
            pin: qsTr("PIN 24")
            col: qsTr("Black")
            title: qsTr("GND")
            description: qsTr("Ground")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("24 pin ATX pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Female connector")
                visible: isPortrait
            }

            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/24pin_atx.png"
                color: Theme.primaryColor
                width: 450 * resScale
                height: 300 * resScale
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
