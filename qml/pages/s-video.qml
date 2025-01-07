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
            col: ""
            title: "Y-GND"
            description: "Ground (Y)"
        }
        ListElement {
            pin: "PIN 2"
            col: ""
            title: "C-GND"
            description: "Ground (C)"
        }
        ListElement {
            pin: "PIN 3"
            col: ""
            title: "Y"
            description: "Intensity (Luminance)"
        }
        ListElement {
            pin: "PIN 4"
            col: ""
            title: "C"
            description: "Color (Chrominance)"
        }
    }

    ListModel {
        id: pagesModel2

        ListElement {
            pin: "PIN 1"
            col: ""
            title: "Y-GND"
            description: "Ground (Y)"
        }
        ListElement {
            pin: "PIN 2"
            col: ""
            title: "C-GND"
            description: "Ground (C)"
        }
        ListElement {
            pin: "PIN 3"
            col: ""
            title: "Y"
            description: "Intensity (Luminance)"
        }
        ListElement {
            pin: "PIN 4"
            col: ""
            title: "C"
            description: "Color (Chrominance)"
        }
        ListElement {
            pin: "PIN 5"
            col: ""
            title: "-"
            description: ""
        }
        ListElement {
            pin: "PIN 6"
            col: ""
            title: "V"
            description: "Composite Video"
        }
        ListElement {
            pin: "PIN 7"
            col: ""
            title: "V-GND"
            description: "Composite Ground"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("S-Video pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }
            SectionHeader {
                text: qsTr("S-Video female")
            }
            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/s-video.png"
                color: Theme.primaryColor
                width: 350 * resScale
                height: 200 * resScale
            }
            HighlightImage {
                id : img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 0
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/s-video-7.png"
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

            SectionHeader {
                text: qsTr("4 pins")
            }

            PinsDetails {
                model: pagesModel
            }
            SectionHeader {
                text: qsTr("7 pins")
            }
            PinsDetails {
                model: pagesModel2
            }
        }
    }
}
