import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    ListModel {
        id: pagesModel

        ListElement {
            pin : qsTr("PIN 1")
            col : qsTr("RED")
            title: qsTr("Shield")
            description : qsTr("Shield Ground")
        }
        ListElement {
            pin : qsTr("PIN 2")
            col : qsTr("BLUE")
            title: qsTr("TXD")
            description: qsTr("Transmit Data")
        }
        ListElement {
            pin : qsTr("PIN 3")
            col : qsTr("ID2/RES")
            title: qsTr("RXD")
            description: qsTr("Receive Data")
        }
        ListElement {
            pin : qsTr("PIN 4")
            col : qsTr("GREEN_RTN")
            title: qsTr("RTS")
            description : qsTr("Request to Send")
        }
        ListElement {
            pin : qsTr("PIN 5")
            col : qsTr("BLUE_RTN")
            title: qsTr("CTS")
            description : qsTr("Clear to Send")
        }
        ListElement {
            pin : qsTr("PIN 6")
            col : qsTr("RED_RTN")
            title: qsTr("DSR")
            description : qsTr("Data Set Ready")
        }
        ListElement {
            pin : qsTr("PIN 7")
            col : qsTr("YELLOW")
            title: qsTr("GND")
            description: qsTr("System Ground")
        }
        ListElement {
            pin : qsTr("PIN 8")
            col : qsTr("GND")
            title: qsTr("CD")
            description: qsTr("Carrier Detect")
        }
        ListElement {
            pin : qsTr("PIN 20")
            col : qsTr("GREEN")
            title: qsTr("DTR")
            description: qsTr("Data Terminal Ready")
        }
        ListElement {
            pin : qsTr("PIN 22")
            col : qsTr("KEY/PWR")
            title: qsTr("RI")
            description: qsTr("Ring Indicator")
        }
    }

    ListModel {
        id: pagesModel2

        ListElement {
            pin : qsTr("PIN 1")
            col : qsTr("Out")
            title: qsTr("Strobe")
            description : qsTr("Control-0")
        }
        ListElement {
            pin : qsTr("PIN 2")
            col : qsTr("In/Out")
            title: qsTr("Data0")
            description: qsTr("Data Bit 0")
        }
        ListElement {
            pin : qsTr("PIN 3")
            col : qsTr("In/Out")
            title: qsTr("Data1")
            description: qsTr("Data Bit 1")
        }
        ListElement {
            pin : qsTr("PIN 4")
            col : qsTr("In/Out")
            title: qsTr("Data2")
            description : qsTr("Data Bit 2")
        }
        ListElement {
            pin : qsTr("PIN 5")
            col : qsTr("In/Out")
            title: qsTr("Data3")
            description : qsTr("Data Bit 3")
        }
        ListElement {
            pin : qsTr("PIN 6")
            col : qsTr("In/Out")
            title: qsTr("Data4")
            description : qsTr("Data Bit 4")
        }
        ListElement {
            pin : qsTr("PIN 7")
            col : qsTr("In/Out")
            title: qsTr("Data5")
            description: qsTr("Data Bit 5")
        }
        ListElement {
            pin : qsTr("PIN 8")
            col : qsTr("In/Out")
            title: qsTr("Data6")
            description: qsTr("Data Bit 6")
        }
        ListElement {
            pin : qsTr("PIN 9")
            col : qsTr("In/Out")
            title: qsTr("Data7")
            description: qsTr("Data Bit 7")
        }
        ListElement {
            pin : qsTr("PIN 10")
            col : qsTr("In")
            title: qsTr("Ack")
            description: qsTr("Status-6")
        }
        ListElement {
            pin : qsTr("PIN 11")
            col : qsTr("In")
            title: qsTr("Busy")
            description: qsTr("Status-7")
        }
        ListElement {
            pin : qsTr("PIN 12")
            col : qsTr("In")
            title: qsTr("Paper-Out")
            description: qsTr("Status-5")
        }
        ListElement {
            pin : qsTr("PIN 13")
            col : qsTr("In")
            title: qsTr("Select")
            description: qsTr("Status-4")
        }
        ListElement {
            pin : qsTr("PIN 14")
            col : qsTr("Out")
            title: qsTr("Linefeed")
            description: qsTr("Control-1")
        }
        ListElement {
            pin : qsTr("PIN 15")
            col : qsTr("In")
            title: qsTr("Error")
            description: qsTr("Status-3")
        }
        ListElement {
            pin : qsTr("PIN 16")
            col : qsTr("Out")
            title: qsTr("Initialize")
            description: qsTr("Control-2")
        }
        ListElement {
            pin : qsTr("PIN 17")
            col : qsTr("Out")
            title: qsTr("Select-Printer")
            description: qsTr("Control-3")
        }
        ListElement {
            pin : qsTr("PIN 18")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 0 Return")
        }
        ListElement {
            pin : qsTr("PIN 19")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 1 Return")
        }
        ListElement {
            pin : qsTr("PIN 20")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 2 Return")
        }
        ListElement {
            pin : qsTr("PIN 21")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 3 Return")
        }
        ListElement {
            pin : qsTr("PIN 22")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 4 Return")
        }
        ListElement {
            pin : qsTr("PIN 23")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 5 Return")
        }
        ListElement {
            pin : qsTr("PIN 24")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 6 Return")
        }
        ListElement {
            pin : qsTr("PIN 25")
            col : qsTr("-")
            title: qsTr("Ground")
            description: qsTr("Data Bit 7 Return")
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id : pagehead
            title: qsTr("DB25 pin assignments")
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
                layer.effect: ShaderEffect {
                    property color color: Theme.primaryColor

                    fragmentShader: "
                    varying mediump vec2 qt_TexCoord0;
                    uniform highp float qt_Opacity;
                    uniform lowp sampler2D source;
                    uniform highp vec4 color;
                    void main() {
                        highp vec4 pixelColor = texture2D(source, qt_TexCoord0);
                        gl_FragColor = vec4(mix(pixelColor.rgb/max(pixelColor.a, 0.00390625), color.rgb/max(color.a, 0.00390625), color.a) * pixelColor.a, pixelColor.a) * qt_Opacity;
                    }
                    "
                }
                layer.enabled: true
                layer.samplerName: "source"
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
                layer.effect: ShaderEffect {
                    property color color: Theme.primaryColor

                    fragmentShader: "
                    varying mediump vec2 qt_TexCoord0;
                    uniform highp float qt_Opacity;
                    uniform lowp sampler2D source;
                    uniform highp vec4 color;
                    void main() {
                        highp vec4 pixelColor = texture2D(source, qt_TexCoord0);
                        gl_FragColor = vec4(mix(pixelColor.rgb/max(pixelColor.a, 0.00390625), color.rgb/max(color.a, 0.00390625), color.a) * pixelColor.a, pixelColor.a) * qt_Opacity;
                    }
                    "
                }
                layer.enabled: true
                layer.samplerName: "source"
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
            }
            Repeater {
                id : list2
                model : pagesModel2
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id : combx
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
