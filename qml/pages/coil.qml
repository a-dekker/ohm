import QtQuick 2.0
import Sailfish.Silica 1.0

import "lib/numbers.js" as Numbers

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    property int mode: 0;

    function calculate() {
        var d = diameter.text;
        var h = length.text;
        var n = windings.text;
        var l = inductance.text;

        diameter.color = Theme.primaryColor;
        length.color = Theme.primaryColor;
        windings.color = Theme.primaryColor;
        inductance.color = Theme.primaryColor;

        if(d == "") {
            mode = 0;
        } else if(h == "") {
            mode = 1;
        } else if(n == "") {
            mode = 2;
        } else if(l == "") {
            mode = 3;
        }

        // base formulae
        // L = μ_0 * N^2 * A / h;
        // A = π/4 * d^2

        var u0 = 4 * Math.PI * 1e-7;

        switch(mode) {
        case 0: // calculate d
            var fn = Numbers.parse(n);
            var fh = Numbers.parse(h);
            var fl = Numbers.parse(l);

            var A = fl * fh / (u0 * Math.pow(fn, 2));
            var fd = Math.sqrt(A / (Math.PI/4));

            diameter.text = Numbers.format(fd);
            diameter.color = Theme.highlightColor;
            break;

        case 1: // calculate h
            var fn = Numbers.parse(n);
            var fl = Numbers.parse(l);
            var fd = Numbers.parse(d);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fh = u0 * Math.pow(fn, 2) * A / fl;

            length.text = Numbers.format(fh);
            length.color = Theme.highlightColor;
            break;

        case 2: // calculate n
            var fl = Numbers.parse(l);
            var fd = Numbers.parse(d);
            var fh = Numbers.parse(h);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fn = Math.sqrt(fl * fh / (u0 * A));

            windings.text = Numbers.format(fn);
            windings.color = Theme.highlightColor;
            break;

        case 3: // calculate l
            var fd = Numbers.parse(d);
            var fn = Numbers.parse(n);
            var fh = Numbers.parse(h);

            var A = Math.PI/4 * Math.pow(fd, 2);
            var fl = u0 * Math.pow(fn, 2) * A / fh;

            inductance.text = Numbers.format(fl);
            inductance.color = Theme.highlightColor;
            break;
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height + Theme.paddingLarge

        VerticalScrollDecorator {}

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("Air-Core Coil") }

            Image {
                id : img1
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall/4
                    bottomMargin: Theme.paddingSmall/4
                }
                fillMode: Image.PreserveAspectFit
                source: "../img/coil.png"
                width: 225 * resScale
                height: 145 * resScale
            }

            TextField {
                id: diameter
                label: qsTr("Medium diameter (meter)")
                width: parent.width
                placeholderText: "d/m"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: length
                label: qsTr("Length (meter)")
                width: parent.width
                placeholderText: qsTr("l/m")
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: windings
                label: qsTr("Number of windings")
                width: parent.width
                placeholderText: "N"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            TextField {
                id: inductance
                label: qsTr("Inductance (Henry)")
                width: parent.width
                placeholderText: "L/H"
                inputMethodHints: Qt.ImhPreferNumbers | Qt.ImhNoPredictiveText
                EnterKey.onClicked: calculate()
            }

            Button {
                text: qsTr("Calculate!")
                anchors.horizontalCenter: parent.horizontalCenter;
                onClicked: calculate();
            }

            Label {
                text: qsTr("Enter any three values and click the button to calculate the fourth. You can use SI prefixes like k, M, G, m, u, etc. by typing them as the last letter.")
                wrapMode: Text.Wrap
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
