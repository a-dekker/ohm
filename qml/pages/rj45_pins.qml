import QtQuick 2.0
import Sailfish.Silica 1.0
import "components/"

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    ListModel {
        id: pagesModel

        ListElement {
            pin: "PIN 1"
            col: "White/Orange"
            title: "Tx+"
            description: "Tx+"
        }
        ListElement {
            pin: "PIN 2"
            col: "Orange"
            title: "Tx-"
            description: "Tx-"
        }
        ListElement {
            pin: "PIN 3"
            col: "White/Green"
            title: "Rx+"
            description: "Rx+"
        }
        ListElement {
            pin: "PIN 4"
            col: "Blue"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 5"
            col: "White/Blue"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 6"
            col: "Green"
            title: "Rx-"
            description: "Rx-"
        }
        ListElement {
            pin: "PIN 7"
            col: "White/Brown"
            title: "-"
            description: "Not used"
        }
        ListElement {
            pin: "PIN 8"
            col: "Brown"
            title: "-"
            description: "Not used"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("RJ-45 pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors.top: pagehead.bottom

            SectionHeader {
                text: qsTr("Ethernet male")
            }
            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/rj45-male.png"
                color: Theme.primaryColor
                width: 350 * resScale
                height: 200 * resScale
            }
            SectionHeader {
                text: qsTr("Ethernet female")
            }
            HighlightImage {
                id: img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 0
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/rj45-female.png"
                color: Theme.primaryColor
                width: 350 * resScale
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
