import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent

        ListModel {
            id: pagesModel

            ListElement {
                page: "resistorcolor.qml"
                title: "Resistor Colorcode"
                section: "Codes"
                icon: "../img/resistor_big_4rings.png"
            }
            ListElement {
                page: "smdresistorcalc.qml"
                title: "SMD Resistor Code"
                section: "Codes"
                icon: "../img/smdresistor.png"
            }
            ListElement {
                page: "induction.qml"
                title: "Inductor Colorcodes"
                section: "Codes"
                icon: "../img/spiral.png"
            }
            ListElement {
                page: "capacitorcodes.qml"
                title: "Capacitor Codes"
                section: "Codes"
                icon: "../img/capacitor.png"
            }

            ListElement {
                page: "ohmslaw.qml"
                title: "Ohm's Law"
                section: "Equations"
                icon: "../img/ohmslaw.png"
            }
            ListElement {
                page: "coil.qml"
                title: "Air-Core Coil"
                section: "Equations"
                icon: "../img/coil.png"
            }
            ListElement {
                page: "lcresonator.qml"
                title: "LC Resonator"
                section: "Equations"
                icon: "../img/lcresonator.png"
            }

            ListElement {
                page: "usb_pins.qml"
                title: "USB"
                section: "Connector Pin Assignments"
                icon: "../img/usb_icon.png"
            }
            ListElement {
                page: "vga_pins.qml"
                title: "VGA"
                section: "Connector Pin Assignments"
                icon: "../img/vga_icon.png"
            }
            ListElement {
                page: "serial_pins.qml"
                title: "DB-9"
                section: "Connector Pin Assignments"
                icon: "../img/seriell_icon.png"
            }
            ListElement {
                page: "db25_pins.qml"
                title: "DB-25"
                section: "Connector Pin Assignments"
                icon: "../img/DSUB_25pin_icon.png"
            }
            ListElement {
                page: "rj45_pins.qml"
                title: "RJ-45"
                section: "Connector Pin Assignments"
                icon: "../img/rj45-icon.png"
            }
        }
    }

    SilicaListView {
        id: listView
        anchors.fill: parent
        model: pagesModel
        header: PageHeader {
            title: "Ohm"
        }
        section {
            property: "section"
            delegate: SectionHeader {
                text: section
            }
        }

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("About.qml"))
            }
        }

        delegate: ListItem {
            id: listItem
            Label {
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.paddingLarge
                text: model.title
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            Image {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: model.icon
                height: mainapp.mediumScreen || mainapp.largeScreen ? 128 : 64
                width: height
            }

            onClicked: pageStack.push(Qt.resolvedUrl(model.page))
        }

        VerticalScrollDecorator {
        }
    }
}
