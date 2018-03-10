import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2
    ListModel {
        id: pagesModel

        ListElement {
            pin : "PIN 1"
            col : "RED"
            title: "Red video"
            description : "Red video"
        }
        ListElement {
            pin : "PIN 2"
            col : "GREEN"
            title: "Green video"
            description: "Green video"
        }
        ListElement {
            pin : "PIN 3"
            col : "BLUE"
            title: "Blue video"
            description: "Blue video"
        }
        ListElement {
            pin : "PIN 4"
            col : "ID2/RES"
            title: "ID bit 2"
            description : "ID bit 2, reserved"
        }
        ListElement {
            pin : "PIN 5"
            col : "GND"
            title: "Ground, Hsync"
            description : "Ground, Hsync"
        }
        ListElement {
            pin : "PIN 6"
            col : "RED_RTN"
            title: "Red return"
            description : "Red return"
        }
        ListElement {
            pin : "PIN 7"
            col : "GREEN_RTN"
            title: "Green return"
            description: "Green return"
        }
        ListElement {
            pin : "PIN 8"
            col : "BLUE_RTN"
            title: "Blue return"
            description: "Blue return"
        }
        ListElement {
            pin : "PIN 9"
            col : "KEY/PWR"
            title: "Key / +5V"
            description: "formerly Key, now +5V"
        }
        ListElement {
            pin : "PIN 10"
            col : "GND"
            title: "Ground, Vsync DDC"
            description: "Ground, Vsync DDC"
        }
        ListElement {
            pin : "PIN 11"
            col : "ID0/RES"
            title: "Monitor ID bit 0"
            description : "formerly Monitor ID bit 0, reserved since E-DDC"
        }
        ListElement {
            pin : "PIN 12"
            col : "ID1/SDA"
            title: "Monitor ID bit 1"
            description: "formerly Monitor ID bit 1, I²C since DDC2"
        }
        ListElement {
            pin : "PIN 13"
            col : "HSYNC"
            title: "Horizontal sync"
            description: "Horizontal sync"
        }
        ListElement {
            pin : "PIN 14"
            col : "VSYNC"
            title: "Vertical sync"
            description: "Vertical sync"
        }
        ListElement {
            pin : "PIN 15"
            col : "ID3/SCL"
            title : "ID bit 3, I²C"
            description : "formerly Monitor ID bit 3, I²C clock since DDC2"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id : pagehead
            title: "VGA pin assignments"
        }

        Column {
            id : column
            anchors {
                top : pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Male (DE-15/HD-15)")
            }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/vga_male.png"
                width: 250 * resScale
                height: 200 * resScale
            }

            SectionHeader {
                text: qsTr("Female (DE-15/HD-15)")
            }

            Image {
                id : img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/vga_female.png"
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

            VerticalScrollDecorator {}

            Repeater {
                id : list
                model : pagesModel
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id : combx
                    //height : Theme.itemSizeSmall
                    width : parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            Label {
                                text : pagesModel.get(index).description
                                font.pixelSize: Theme.fontSizeExtraSmall
                                color : Theme.primaryColor
                                anchors {
                                    verticalCenter: parent.verticalCenter
                                    horizontalCenter: parent.horizontalCenter
                                }
                            }

                            height : Theme.itemSizeSmall
                            onClicked: combx.currentIndex = -1
                        }
                    }
                    Label {
                        anchors {
                            left : parent.horizontalCenter
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.title
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id : co
                        anchors {
                            left : pin.right
                            leftMargin: Theme.paddingLarge*2
                            rightMargin: Theme.paddingLarge*2
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.col
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id : pin
                        anchors {
                            left : parent.left
                            leftMargin: Theme.paddingLarge
                            rightMargin: Theme.paddingLarge
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.pin
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }

                }

            }
        }
    }
}
