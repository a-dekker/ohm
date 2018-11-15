import QtQuick 2.0
import Sailfish.Silica 1.0

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
        contentHeight: column.height + pagehead.height + list.height
        PageHeader {
            id: pagehead
            title: qsTr("DB-9 pin assignments")
        }

        Column {
            id: column
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("Serial/RS232 male")
            }
            Image {
                id: img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/seriell_male.png"
                width: 250 * resScale
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
                text: qsTr("Serial/RS232 female")
            }

            Image {
                id: img2
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall / 4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/serial_female.png"
                width: 250 * resScale
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

            VerticalScrollDecorator {
            }

            Repeater {
                id: list
                model: pagesModel
                anchors.bottomMargin: Theme.paddingLarge

                ComboBox {
                    id: combx
                    //  height : Theme.itemSizeSmall / 1.5
                    width: parent.width
                    currentIndex: -1
                    menu: ContextMenu {
                        MenuItem {
                            Label {
                                text: pagesModel.get(index).description
                                font.pixelSize: Theme.fontSizeExtraSmall / 1.5 * resScale
                                color: Theme.primaryColor
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
                            left: parent.horizontalCenter
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
                        id: co
                        anchors {
                            left: pin.right
                            leftMargin: Theme.paddingLarge * 2
                            rightMargin: Theme.paddingLarge * 2
                            verticalCenter: parent.verticalCenter
                        }
                        height: Theme.itemSizeSmall / 1.5
                        text: model.col
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                    }
                    Label {
                        id: pin
                        anchors {
                            left: parent.left
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
