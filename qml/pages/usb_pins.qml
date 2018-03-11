import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    ListModel {
        id: pagesModel

        ListElement {
            pin : qsTr("PIN 1")
            col : ""
            title: qsTr("Ground")
            description : qsTr("Ground")
        }
        ListElement {
            pin : qsTr("PIN 2")
            col : ""
            title: qsTr("Data+")
            description: qsTr("Data+")
        }
        ListElement {
            pin : qsTr("PIN 3")
            col : ""
            title: qsTr("Data−")
            description: qsTr("Data−")
        }
        ListElement {
            pin : qsTr("PIN 4")
            col : ""
            title: qsTr("VCC (+5 V)")
            description : qsTr("VCC (+5 V)")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id : pagehead
            title: qsTr("USB pin assignments")
        }

        Column {
            id : column
            anchors {
                top : pagehead.bottom
            }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/usb_norm.png"
                width: 250 * resScale
                height: 200 * resScale

            }
            Image {
                id : img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/usb_mini.png"
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
                    // height : Theme.itemSizeSmall / 1.5
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
