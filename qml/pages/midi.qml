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
            col: "-"
            title: "N/C"
            description: "Not connected"
        }
        ListElement {
            pin: "PIN 2"
            col: "-"
            title: "GROUND"
            description: "Shield"
        }
        ListElement {
            pin: "PIN 3"
            col: "-"
            title: "N/C"
            description: "Not connected"
        }
        ListElement {
            pin: "PIN 4"
            col: "-"
            title: "CSINK"
            description: "Current Sink"
        }
        ListElement {
            pin: "PIN 5"
            col: "-"
            title: "CSRC"
            description: "Current Source"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("MIDI Out pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }
            SectionHeader {
                text: qsTr("MIDI male")
            }
            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/midi_male.png"
                color: Theme.primaryColor
                width: 350 * resScale
                height: 200 * resScale
            }

            SectionHeader {
                text: qsTr("MIDI female")
            }
            HighlightImage {
                id: img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/midi_female.png"
                color: Theme.primaryColor
                width: 250 * resScale
                height: 200 * resScale
            }

            Label {
                text: qsTr("Musical Instrument Digital Interface\n")
                font.pixelSize: mainapp.largeScreen ? Theme.fontSizeMedium : Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.Wrap
                color: Theme.secondaryColor
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
