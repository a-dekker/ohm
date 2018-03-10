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
            title: "Shield"
            description : "Shield Ground"
        }
        ListElement {
            pin : "PIN 2"
            col : "BLUE"
            title: "TXD"
            description: "Transmit Data"
        }
        ListElement {
            pin : "PIN 3"
            col : "ID2/RES"
            title: "RXD"
            description: "Receive Data"
        }
        ListElement {
            pin : "PIN 4"
            col : "GREEN_RTN"
            title: "RTS"
            description : "Request to Send"
        }
        ListElement {
            pin : "PIN 5"
            col : "BLUE_RTN"
            title: "CTS"
            description : "Clear to Send"
        }
        ListElement {
            pin : "PIN 6"
            col : "RED_RTN"
            title: "DSR"
            description : "Data Set Ready"
        }
        ListElement {
            pin : "PIN 7"
            col : "YELLOW"
            title: "GND"
            description: "System Ground"
        }
        ListElement {
            pin : "PIN 8"
            col : "GND"
            title: "CD"
            description: "Carrier Detect"
        }
        ListElement {
            pin : "PIN 20"
            col : "GREEN"
            title: "DTR"
            description: "Data Terminal Ready"
        }
        ListElement {
            pin : "PIN 22"
            col : "KEY/PWR"
            title: "RI"
            description: "Ring Indicator"
        }
    }

    ListModel {
        id: pagesModel2

        ListElement {
            pin : "PIN 1"
            col : "Out"
            title: "Strobe"
            description : "Control-0"
        }
        ListElement {
            pin : "PIN 2"
            col : "In/Out"
            title: "Data0"
            description: "Data Bit 0"
        }
        ListElement {
            pin : "PIN 3"
            col : "In/Out"
            title: "Data1"
            description: "Data Bit 1"
        }
        ListElement {
            pin : "PIN 4"
            col : "In/Out"
            title: "Data2"
            description : "Data Bit 2"
        }
        ListElement {
            pin : "PIN 5"
            col : "In/Out"
            title: "Data3"
            description : "Data Bit 3"
        }
        ListElement {
            pin : "PIN 6"
            col : "In/Out"
            title: "Data4"
            description : "Data Bit 4"
        }
        ListElement {
            pin : "PIN 7"
            col : "In/Out"
            title: "Data5"
            description: "Data Bit 5"
        }
        ListElement {
            pin : "PIN 8"
            col : "In/Out"
            title: "Data6"
            description: "Data Bit 6"
        }
        ListElement {
            pin : "PIN 9"
            col : "In/Out"
            title: "Data7"
            description: "Data Bit 7"
        }
        ListElement {
            pin : "PIN 10"
            col : "In"
            title: "Ack"
            description: "Status-6"
        }
        ListElement {
            pin : "PIN 11"
            col : "In"
            title: "Busy"
            description: "Status-7"
        }
        ListElement {
            pin : "PIN 12"
            col : "In"
            title: "Paper-Out"
            description: "Status-5"
        }
        ListElement {
            pin : "PIN 13"
            col : "In"
            title: "Select"
            description: "Status-4"
        }
        ListElement {
            pin : "PIN 14"
            col : "Out"
            title: "Linefeed"
            description: "Control-1"
        }
        ListElement {
            pin : "PIN 15"
            col : "In"
            title: "Error"
            description: "Status-3"
        }
        ListElement {
            pin : "PIN 16"
            col : "Out"
            title: "Initialize"
            description: "Control-2"
        }
        ListElement {
            pin : "PIN 17"
            col : "Out"
            title: "Select-Printer"
            description: "Control-3"
        }
        ListElement {
            pin : "PIN 18"
            col : "-"
            title: "Ground"
            description: "Data Bit 0 Return"
        }
        ListElement {
            pin : "PIN 19"
            col : "-"
            title: "Ground"
            description: "Data Bit 1 Return"
        }
        ListElement {
            pin : "PIN 20"
            col : "-"
            title: "Ground"
            description: "Data Bit 2 Return"
        }
        ListElement {
            pin : "PIN 21"
            col : "-"
            title: "Ground"
            description: "Data Bit 3 Return"
        }
        ListElement {
            pin : "PIN 22"
            col : "-"
            title: "Ground"
            description: "Data Bit 4 Return"
        }
        ListElement {
            pin : "PIN 23"
            col : "-"
            title: "Ground"
            description: "Data Bit 5 Return"
        }
        ListElement {
            pin : "PIN 24"
            col : "-"
            title: "Ground"
            description: "Data Bit 6 Return"
        }
        ListElement {
            pin : "PIN 25"
            col : "-"
            title: "Ground"
            description: "Data Bit 7 Return"
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id : pagehead
            title: "DB25 pin assignments"
        }

        Column {
            id : column
            anchors {
                top : pagehead.bottom
            }
            SectionHeader {
                text: qsTr("Male")
            }
            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/SubD25_male.png"
                width: 350 * resScale
                height: 200 * resScale
            }
            SectionHeader {
                text: qsTr("Female")
            }
            Image {
                id : img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 0
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/SubD25_female.png"
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

            VerticalScrollDecorator {}

            SectionHeader {
                text: qsTr("Serial/RS232")
            }

            Repeater {
                id : list
                model : pagesModel
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id : combx
                    //  height : Theme.itemSizeSmall / 1.5
                    width : parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            Label {
                                text : pagesModel.get(index).description
                                font.pixelSize: Theme.fontSizeExtraSmall / 1.5 * resScale
                                color : Theme.primaryColor
                                anchors {
                                    verticalCenter: parent.verticalCenter
                                    horizontalCenter: parent.horizontalCenter
                                }
                            }
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
            SectionHeader {
                text: qsTr("Parallel")
                visible: isPortrait || (mainapp.largeScreen)
            }
            Repeater {
                id : list2
                model : pagesModel2
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id : combx
                    //  height : Theme.itemSizeSmall / 1.5
                    width : parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            Label {
                                text : pagesModel2.get(index).description
                                font.pixelSize: Theme.fontSizeExtraSmall / 1.5 * resScale
                                color : Theme.primaryColor
                                anchors {
                                    verticalCenter: parent.verticalCenter
                                    horizontalCenter: parent.horizontalCenter
                                }
                            }
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
