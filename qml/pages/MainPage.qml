import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent

        ListModel {
            id: pagesModel

            ListElement {
                page: "resistorcolor.qml"
                title: qsTr("Resistor Colorcode")
                section: "Codes"
                icon: "../img/resistor_big_4rings.png"
            }
            ListElement {
                page: "smdresistorcalc.qml"
                title: qsTr("SMD Resistor Code")
                section: "Codes"
                icon: "../img/smdresistor.png"
            }
            ListElement {
                page: "induction.qml"
                title: qsTr("Inductor Colorcodes")
                section: "Codes"
                icon: "../img/spiral.png"
            }
            ListElement {
                page: "capacitorcodes.qml"
                title: qsTr("Capacitor Codes")
                section: "Codes"
                icon: "../img/capacitor.png"
            }
            ListElement {
                page: "dipswitch.qml"
                title: qsTr("DMX dip switch Calculator")
                section: "Codes"
                icon: "../img/dipswitch_icon.png"
            }

            ListElement {
                page: "ohmslaw.qml"
                title: qsTr("Ohm's Law")
                section: "Equations"
                icon: "../img/ohmslaw.png"
            }
            ListElement {
                page: "coil.qml"
                title: qsTr("Air-Core Coil")
                section: "Equations"
                icon: "../img/coil.png"
            }
            ListElement {
                page: "lcresonator.qml"
                title: qsTr("LC Resonator")
                section: "Equations"
                icon: "../img/lcresonator.png"
            }

            ListElement {
                page: "usb_pins.qml"
                title: qsTr("USB")
                section: "Connector Pin Assignments"
                icon: "../img/usb_icon.png"
            }
            ListElement {
                page: "micro_usb_pins.qml"
                title: qsTr("Mini/Micro USB")
                section: "Connector Pin Assignments"
                icon: "../img/micro_usb_icon.png"
            }
            ListElement {
                page: "vga_pins.qml"
                title: qsTr("VGA")
                section: "Connector Pin Assignments"
                icon: "../img/vga_icon.png"
            }
            ListElement {
                page: "serial_pins.qml"
                title: qsTr("DB-9")
                section: "Connector Pin Assignments"
                icon: "../img/seriell_icon.png"
            }
            ListElement {
                page: "db25_pins.qml"
                title: qsTr("DB-25")
                section: "Connector Pin Assignments"
                icon: "../img/DSUB_25pin_icon.png"
            }
            ListElement {
                page: "rj45_pins.qml"
                title: qsTr("RJ-45")
                section: "Connector Pin Assignments"
                icon: "../img/rj45-icon.png"
            }
            ListElement {
                page: "s-video.qml"
                title: qsTr("S-Video")
                section: "Connector Pin Assignments"
                icon: "../img/s-video.png"
            }
            ListElement {
                page: "ps2.qml"
                title: qsTr("PS/2")
                section: "Connector Pin Assignments"
                icon: "../img/ps2.png"
            }
            ListElement {
                page: "midi.qml"
                title: qsTr("MIDI")
                section: "Connector Pin Assignments"
                icon: "../img/midi_male.png"
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
                text: qsTr("About")
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
            HighlightImage {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: model.icon
                color: Theme.primaryColor
                height: mainapp.mediumScreen || mainapp.largeScreen ? 128 : 64
                width: height
            }

            onClicked: pageStack.push(Qt.resolvedUrl(model.page))
        }

        VerticalScrollDecorator {
            flickable: listView
        }
    }
}
