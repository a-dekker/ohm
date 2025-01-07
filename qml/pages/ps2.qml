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
            title: "+DATA"
            description: "Data"
        }
        ListElement {
            pin: "PIN 2"
            col: ""
            title: "-"
            description: "Not connected"
        }
        ListElement {
            pin: "PIN 3"
            col: ""
            title: "GND"
            description: "Ground"
        }
        ListElement {
            pin: "PIN 4"
            col: ""
            title: "Vcc"
            description: "+5 V DC at 275 mA"
        }
        ListElement {
            pin: "PIN 5"
            col: ""
            title: "+CLK"
            description: "Clock"
        }
        ListElement {
            pin: "PIN 6"
            col: ""
            title: "-"
            description: "Not connected"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("PS/2 pin assignments")
        }

        Column {
            id: column
            width: page.width
            anchors {
                top: pagehead.bottom
            }
            SectionHeader {
                text: qsTr("PS/2 female")
            }
            HighlightImage {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/ps2.png"
                color: Theme.primaryColor
                width: 350 * resScale
                height: 200 * resScale
            }
            Label {
                text: qsTr("Purple for keyboard/Green for mouse\n")
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
