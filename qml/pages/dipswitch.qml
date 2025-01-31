import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2
    property variant switchState: ["off", "off", "off", "off", "off", "off", "off", "off", "off", "off"]

    function calc(num) {
        var k = 0
        var res = ""
        var dif = 0
        var tekst = new Array
        var omkeren = new Array()
        var omRes = new Array()
        res = num.toString(2)

        for (var i = 0; i <= res.length - 1; i++) {
            omkeren[i] = res.charAt(i)
        }

        omRes = omkeren.reverse()

        dif = 10 - res.length
        for (i = res.length; i <= 9; i++) {
            omRes[i] = 0
        }

        for (i = 0; i <= 9; i++) {
            if (omRes[i] === 1 || omRes[i] === "1") {
                tekst.push("on")
            }
            if (omRes[i] === 0 || omRes[i] === "0") {
                tekst.push("off")
            }
        }

        switchState = tekst

        tekst = new Array()
        omkeren = new Array()
        omRes = new Array()
    }

    SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height + pagehead.height
        PageHeader {
            id: pagehead
            title: qsTr("DMX-512 dip switch calculator")
        }

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            anchors {
                top: pagehead.bottom
            }

            SectionHeader {
                text: qsTr("State of switches")
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: mainapp.smallScreen ? Theme.paddingSmall : Theme.paddingMedium
                HighlightImage {
                    source: "../img/" + switchState[0] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[1] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[2] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[3] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[4] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[5] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[6] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[7] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[8] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
                HighlightImage {
                    source: "../img/" + switchState[9] + ".png"
                    color: Theme.primaryColor
                    fillMode: Image.PreserveAspectFit
                    width: mainapp.smallScreen ? 49 : 80
                    height: mainapp.smallScreen ? 116 : 190
                }
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: mainapp.smallScreen ? Theme.paddingSmall : Theme.paddingMedium
                Label {
                    text: " 1"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 2"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 3"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 4"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 5"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 6"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 7"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 8"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: " 9"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: "10"
                    width: mainapp.smallScreen ? 49 : 80
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            SectionHeader {
                text: qsTr("Value")
            }

            TextField {
                id: valueField
                width: parent.width - Theme.paddingLarge
                placeholderText: qsTr("Enter value (max 511)")
                //Qt.ImhDigitsOnly does not work in landscape
                inputMethodHints: isPortrait ? Qt.ImhDigitsOnly : Qt.ImhPreferNumbers
                validator: RegExpValidator {
                    regExp: /^[0-9]{1,3}$/
                }
                EnterKey.enabled: text.trim().length > 0
                EnterKey.highlighted: true
                EnterKey.text: "OK"
                EnterKey.onClicked: {
                    if (parseInt(valueField.text) > 511) {
                        valueField.text = "511"
                    }
                    calc(parseInt(valueField.text))
                }
                label: qsTr("Enter your value")
                focus: true
            }

            VerticalScrollDecorator {
            }
        }
    }
}
