import QtQuick 2.0
import Sailfish.Silica 1.0
import "components/"

Page {
    id: page
    // TODO: test Theme.pixelRatio
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    ListModel {
        id: pagesModel

        ListElement {
            pin : qsTr("PIN 1")
            col : qsTr("Red")
            title: qsTr("VBUS")
            description : qsTr("VCC (+5 V)")
        }
        ListElement {
            pin : qsTr("PIN 2")
            col : qsTr("White")
            title: qsTr("D-")
            description: qsTr("Data −")
        }
        ListElement {
            pin : qsTr("PIN 3")
            col : qsTr("Green")
            title: qsTr("D+")
            description: qsTr("Data +")
        }
        ListElement {
            pin : qsTr("PIN 4")
            col : ""
            title: qsTr("ID")
            description: qsTr("ID")
        }
        ListElement {
            pin : qsTr("PIN 5")
            col : qsTr("Black")
            title: qsTr("GND")
            description : qsTr("Ground")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id : column
            width: page.width

            PageHeader {
                id : pagehead
                title: qsTr("Micro USB pin assignments")
            }

            SectionHeader {
                text: qsTr("Micro-B")
            }

            Row {
                spacing: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: Theme.paddingSmall
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Male plug")
                        font.family: Theme.fontFamilyHeading
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryHighlightColor
                    }

                    HighlightImage {
                        fillMode: Image.PreserveAspectFit
                        color: Theme.primaryColor
                        source: "../img/micro_usb_b_plug.png"
                        width: 250 * resScale
                        height: 200 * resScale
                    }
                }

                Column {
                    spacing: Theme.paddingSmall
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Female receptacle")
                        font.family: Theme.fontFamilyHeading
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryHighlightColor
                    }

                    HighlightImage {
                        fillMode: Image.PreserveAspectFit
                        color: Theme.primaryColor
                        source: "../img/micro_usb_b_receptacle.png"
                        width: 250 * resScale
                        height: 200 * resScale
                    }
                }
            }


            SectionHeader {
                text: qsTr("Mini-B")
            }

            Row {
                spacing: Theme.paddingLarge
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: Theme.paddingSmall
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Male plug")
                        font.family: Theme.fontFamilyHeading
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryHighlightColor
                    }

                    HighlightImage {
                        fillMode: Image.PreserveAspectFit
                        color: Theme.primaryColor
                        source: "../img/mini_usb_b_plug.png"
                        width: 250 * resScale
                        height: 200 * resScale
                    }
                }

                Column {
                    spacing: Theme.paddingSmall
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Female receptacle")
                        font.family: Theme.fontFamilyHeading
                        font.pixelSize: Theme.fontSizeSmall
                        color: Theme.secondaryHighlightColor
                    }

                    HighlightImage {
                        fillMode: Image.PreserveAspectFit
                        color: Theme.primaryColor
                        source: "../img/mini_usb_b_receptacle.png"
                        width: 250 * resScale
                        height: 200 * resScale
                    }
                }
            }

            Item {
                width: 1
                height: Theme.paddingMedium
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            VerticalScrollDecorator {}

            PinsDetails {
                model: pagesModel
            }
        }
    }
}
