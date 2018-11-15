import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: textInputPage
    property int textAlignment: Text.AlignLeft
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge
        VerticalScrollDecorator {}
        Column {
            id: column
            property double ohmcalc: 0
            property string ohmval: ""
            width: parent.width
            spacing: Theme.paddingLarge
            PageHeader { title: qsTr("SMD Resistor Code") }
            Image {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/smdresistor.png"
                height: mainapp.mediumScreen || mainapp.largeScreen ? 256 : 128
                width: height
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
            function textcontainsOnlyNumbers(text) {
                for (var i = 0; i < text.length; i++) {
                    if (!(text.charAt(i) >= '0' && text.charAt(i) <= '9')) {
                        return false;
                    }
                }
                return true;
            }

            function getunitprefix() {
                if (!column.textcontainsOnlyNumbers(textf.text)) {
                    return "";
                }

                var val = 0;
                if (parseInt(textf.text.length) === 3) {
                    val = parseInt(textf.text.charAt(2));
                    switch (val) {
                    case 0 : return ""
                    case 1 : return "0"
                    case 2 : return "k"
                    case 3 : return "k"
                    case 4 : return "0k"
                    case 5 : return "M"
                    case 6 : return "M"
                    case 7 : return "0M"
                    case 8 : return "G"
                    case 9 : return "G"
                    case -1 : return ""
                    case -2 : return ""
                    default : return ""
                    }
                }
                if (parseInt(textf.text.length) === 4) {
                    val = parseInt(textf.text.charAt(3));
                    switch (val) {
                    case 0 : return ""
                    case 1 : return "k"
                    case 2 : return "k"
                    case 3 : return "k"
                    case 4 : return "6"
                    case 5 : return "M"
                    case 6 : return "M"
                    case 7 : return "G"
                    case 8 : return "G"
                    case 9 : return "G"
                    case -1 : return ""
                    case -2 : return ""
                    default : return ""
                    }
                }
                return "";
            }

            function strcontains(text,ch) {
                var txtlength = text.length
                for (var i = 0; i < txtlength; i++) {
                    if (text.charAt(i) === ch) {
                        return i;
                    }
                }
                return -1;
            }

            function toOhm() {
                console.log("text was: " + textf.text);
                console.log("length was: " + textf.text.length)
                var tmp = 0;
                /* if it's zero, the value is zero too */
                if (textf.text === "0") {
                    column.ohmcalc = 0;
                }


                /* get the position of the 'R' */
                var rpos = column.strcontains(textf.text,'R');
                if (rpos !== -1) {
                    var bef = "";
                    var aft = "";
                    if (textf.text.length >= 3) {
                        var i = 0;
                        while (textf.text.charAt(i) !== 'R') {
                            bef = bef + textf.text.charAt(i);
                            i++;
                        }
                        i++;
                        while (i < textf.text.length) {
                            aft = aft + textf.text.charAt(i);
                            i++;
                        }
                        var nr = "" + bef + "." + aft;
                        console.log("number is: " + bef + "." + aft);
                        tmp = parseFloat(nr);
                    }
                }


                /* if its numbers only, we can easily calculate the value */
                else if (textf.text.length === 3 && column.textcontainsOnlyNumbers(textf.text)) {
                    console.log("char at 1: " + textf.text.charAt(1))
                    tmp = parseInt(textf.text.charAt(0))*10 + parseInt(textf.text.charAt(1));
                    console.log("val: " + tmp);
                    switch (parseInt(textf.text.charAt(2))) {
                    case 2 : tmp = tmp / 10;
                        break;
                    case 5 : tmp = tmp / 10;
                        break;
                    case 8 : tmp = tmp / 10;
                        break;
                    case -1 : tmp = tmp / 10;
                        break;
                    case -2 : tmp = tmp / 100;
                        break;
                    default : break
                    }
                }
                /* if its numbers only, we can easily calculate the value */
                else if (textf.text.length === 4 && column.textcontainsOnlyNumbers(textf.text)) {
                    console.log("char at 1: " + textf.text.charAt(1))
                    tmp = parseInt(textf.text.charAt(0))*100 + parseInt(textf.text.charAt(1))*10 + parseInt(textf.text.charAt(2));
                    console.log("val: " + tmp);
                    switch (parseInt(textf.text.charAt(3))) {
                    case 1 : tmp = tmp / 100;
                        break;
                    case 2 : tmp = tmp / 10;
                        break;
                    case 4 : tmp = tmp / 100;
                        break;
                    case 5 : tmp = tmp / 10;
                        break;
                    case 7 : tmp = tmp / 100;
                        break;
                    case 8 : tmp = tmp / 10;
                        break;
                    case -1 : tmp = tmp / 10;
                        break;
                    case -2 : tmp = tmp / 100;
                        break;
                    default : break
                    }
                }
                column.ohmcalc = tmp;
            }

            function updateValues() {
                column.toOhm();
                column.ohmval = column.ohmcalc + column.getunitprefix() + " Ω"
            }

            Label {
                text : qsTr("Value")
                color: Theme.secondaryColor
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text : column.ohmval
                anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField {
                id : textf
                width: parent.width
                focus: true
                inputMethodHints: Qt.ImhNoPredictiveText
                label: qsTr("Resistor Code")
                placeholderText: qsTr("Type Code here")
                horizontalAlignment: textAlignment
                EnterKey.onClicked: {
                    column.updateValues();
                    parent.focus = false
                }
            }
        }
    }
}
