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
            title: qsTr("Signal Ground")
            description: qsTr("Signal Ground")
        }
        ListElement {
            pin: qsTr("PIN 2")
            col: qsTr("ID2/RES")
            title: qsTr("Received Data")
            description: qsTr("Received Data")
        }
        ListElement {
            pin: qsTr("PIN 3")
            col: qsTr("BLUE")
            title: qsTr("Transmitted Data")
            description: qsTr("Transmitted Data")
        }
        ListElement {
            pin: qsTr("PIN 4")
            col: qsTr("GREEN")
            title: qsTr("Data Terminal Ready")
            description: qsTr("Data Terminal Ready")
        }
        ListElement {
            pin: qsTr("PIN 5")
            col: qsTr("GND")
            title: qsTr("Data Carrier Connect")
            description: qsTr("Data Carrier Connect")
        }
        ListElement {
            pin: qsTr("PIN 6")
            col: qsTr("RED_RTN")
            title: qsTr("Data Set Ready")
            description: qsTr("Data Set Ready")
        }
        ListElement {
            pin: qsTr("PIN 7")
            col: qsTr("GREEN_RTN")
            title: qsTr("Request to Send")
            description: qsTr("Request to Send")
        }
        ListElement {
            pin: qsTr("PIN 8")
            col: qsTr("BLUE_RTN")
            title: qsTr("Clear To Send")
            description: qsTr("Clear To Send")
        }
        ListElement {
            pin: qsTr("PIN 9")
            col: qsTr("KEY/PWR")
            title: qsTr("Ring Indicator")
            description: qsTr("Ring Indicator")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("DB-9 pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Serial/RS232 male")
            }
            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/seriell_male.png"
                color: Theme.primaryColor
                width: 250 * resScale
                height: 200 * resScale
            }
            SectionHeader {
                text: qsTr("Serial/RS232 female")
            }

            HighlightImage {
                id: img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/serial_female.png"
                color: Theme.primaryColor
                width: 250 * resScale
                height: 200 * resScale
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            VerticalScrollDecorator {
            }

            PinsDetails {
                model: pagesModel
            }
        }
    }
}
