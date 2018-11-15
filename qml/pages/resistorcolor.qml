import QtQuick 2.0
import Sailfish.Silica 1.0
//import "js/resistorcolor.js" as ResistorColor

Page {
    id: page
    property int resScale: mainapp.smallScreen ? 1 : mainapp.mediumScreen ? 2 : 2

    SilicaFlickable {
        contentHeight: column.height
        anchors.fill: parent
        //Component.onCompleted: ResistorColor.createRows(column.rings,row1)
        VerticalScrollDecorator {}
        Column {
            id: column
            spacing: Theme.paddingSmall
            property real dotspace: resScale === 1 ? Theme.itemSizeSmall / 2.2 : Theme.itemSizeSmall / 2.2 * ( resScale * 0.7)
            property bool defaultdimm: false
            property double calcohm: 0
            property real rings: 4 /* default value for resistor rings */
            property string ohmvalue : " Ω"
            anchors {
                topMargin: Theme.paddingSmall
            }

            PageHeader {
                title: qsTr("Resistor Colorcode")
            }

            function resolvId(nr) {
                //console.log("resolvid: " + nr);
                switch(nr) {
                case 0 : return "#000000";
                case 1 : return "#854928";
                case 2 : return "#ff0000";
                case 3 : return "#ff9900";
                case 4 : return "#ffff00";
                case 5 : return "#008000";
                case 6 : return "#0000ff";
                case 7 : return "#ee82ee";
                case 8 : return "#808080";
                case 9 : return "#ffffff";
                case -1 : return "#ffd700";
                case -2 : return "#c0c0c0";
                default : return "transparent"
                }
            }
            function setcolor() {
                //console.log("setcolor");
                for (var i = 0; i < column.rings; i++) {
                    colorrings.itemAt(i).color = column.resolvId(storevalues.itemAt(i).val);
                }
            }

            function setpositions() {
                var startpsX = 0
                var startpsY = 0
                var shiftX = 6.4 * resScale
                var ringwidth = 7.6 * resScale
                if (column.rings === 3) {
                    startpsX = 45 * resScale
                    startpsY = 21 * resScale
                }
                if (column.rings === 4) {
                    startpsX = 38.4 * resScale
                    startpsY = 21 * resScale
                }
                if (column.rings === 5) {
                    startpsX = 31 * resScale
                    startpsY = 21 * resScale

                }
                if (column.rings === 6) {
                    startpsX = 24.2 * resScale
                    startpsY = 21 * resScale

                }
                for (var i = 0; i < column.rings; i++) {
                    colorrings.itemAt(i).x = startpsX + ((shiftX + ringwidth)*i);
                    //console.log("col: " + colorrings.itemAt(i).color);
                    //console.log("x: " + colorrings.itemAt(i).x);
                    colorrings.itemAt(i).y = startpsY;
                }

            }

            Image {
                id : img
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
                fillMode: Image.PreserveAspectFit
                source: {
                    if (column.rings === 3) {
                        return "../img/resistor_big_3rings.png"
                    } else if (column.rings === 4) {
                        return "../img/resistor_big_4rings.png"
                    } else if (column.rings === 5) {
                        return "../img/resistor_big_5rings.png"
                    } else if (column.rings === 6) {
                        return "../img/resistor_big_6rings.png"
                    }
                }

                width: 125 * resScale
                height: 100 * resScale
                z : 1
                Repeater {
                    id : colorrings
                    model : column.rings
                    Rectangle {
                        color : "transparent"
                        width : 7.9 * resScale
                        height : 57.1 * resScale
                        z : 100 * resScale
                    }
                }
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


            // insert graphic here
            Label {
                id : ohmlabel
                text : " Ω"
                font.pixelSize: Theme.fontSizeMedium
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingSmall /4
                    bottomMargin: Theme.paddingSmall / 4
                }
            }

            Separator {
                id: effect
                color: Theme.primaryColor
                width: page.width
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Qt.AlignHCenter
            }

            function updateRow1(row) {
                for (var i = 0; i < row.model; i++) {
                    if (i === 0) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 3) && (row.model === 4)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 4) && ((row.model === 5) || (row.model === 6))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                }
            }
            function updateRow4_5(row) {
                for (var i = 0; i < row.model; i++) {
                    //console.log("index is: " + i + " rep.model is: " + row.model)
                    if ((i === 3) && (row.model === 4)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 4) && ((row.model === 5))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 4) && ((row.model === 6))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                }
            }
            function updateRow9(row) {
                for (var i = 0; i < row.model; i++) {
                    //console.log("index is: " + i + " rep.model is: " + row.model)
                    if ((i === 3) && (row.model === 4)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 4) && ((row.model === 5))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 5) && ((row.model === 5))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 4) || (i === 5) && ((row.model === 6))) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                }
            }
            function updateRow10_11(row) {
                for (var i = 0; i < row.model; i++) {
                    //console.log("index is: " + i + " rep.model is: " + row.model)
                    if ((i === 0 || i === 1 ) && (row.model === 3)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 0 || i === 1 ) && (row.model === 4)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 0 || i === 1 || i === 2) && (row.model === 5)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                    }
                    if ((i === 0 || i === 1 || i === 2 || i === 5) && (row.model === 6)) {
                        if (!(row.itemAt(i) === null)) {
                            row.itemAt(i).color = "transparent";
                        }
                        //console.log("transp: " + row.itemAt(i).color.value)
                    }
                }
            }
            function clearcolumn(column) {
                //console.log("column: " + column)
                if (column <= rep00.model) {
                    //console.log("rep00 :" + rep00.model)
                    rep00.itemAt(column).dimmed = true;
                    rep00.itemAt(column).radius = 1.0;
                    rep00.itemAt(column).ratio = 1.0;
                }
                if (column <= rep10.model) {
                    //console.log("rep10 :" + rep10.model)
                    rep10.itemAt(column).dimmed = true;
                    rep10.itemAt(column).radius = 1.0;
                    rep10.itemAt(column).ratio = 1.0;
                }
                if (column <= rep20.model) {
                    //console.log("rep20 :" + rep20.model)
                    rep20.itemAt(column).dimmed = true;
                    rep20.itemAt(column).radius = 1.0;
                    rep20.itemAt(column).ratio = 1.0;
                }
                if (column <= rep30.model) {
                    //console.log("rep30 :" + rep30.model)
                    rep30.itemAt(column).dimmed = true;
                    rep30.itemAt(column).radius = 1.0;
                    rep30.itemAt(column).ratio = 1.0;
                }
                if (column <= rep40.model) {
                    //console.log("rep40 :" + rep40.model)
                    rep40.itemAt(column).dimmed = true;
                    rep40.itemAt(column).radius = 1.0;
                    rep40.itemAt(column).ratio = 1.0;
                }
                if (column <= rep50.model) {
                    //console.log("rep50 :" + rep50.model)
                    rep50.itemAt(column).dimmed = true;
                    rep50.itemAt(column).radius = 1.0;
                    rep50.itemAt(column).ratio = 1.0;
                }
                if (column <= rep60.model) {
                    //console.log("rep60 :" + rep60.model)
                    rep60.itemAt(column).dimmed = true;
                    rep60.itemAt(column).radius = 1.0;
                    rep60.itemAt(column).ratio = 1.0;
                }
                if (column <= rep70.model) {
                    //console.log("rep70 :" + rep70.model)
                    rep70.itemAt(column).dimmed = true;
                    rep70.itemAt(column).radius = 1.0;
                    rep70.itemAt(column).ratio = 1.0;
                }
                if (column <= rep80.model) {
                    //console.log("rep80 :" + rep80.model)
                    rep80.itemAt(column).dimmed = true;
                    rep80.itemAt(column).radius = 1.0;
                    rep80.itemAt(column).ratio = 1.0;
                }
                if (column <= rep90.model) {
                    //console.log("rep90 :" + rep90.model)
                    rep90.itemAt(column).dimmed = true;
                    rep90.itemAt(column).radius = 1.0;
                    rep90.itemAt(column).ratio = 1.0;
                }
                if (column <= rep100.model) {
                    //console.log("rep100 :" + rep100.model)
                    rep100.itemAt(column).dimmed = true;
                    rep100.itemAt(column).radius = 1.0;
                    rep100.itemAt(column).ratio = 1.0;
                }
                if (column <= rep110.model) {
                    //console.log("rep110 :" + rep110.model)
                    rep110.itemAt(column).dimmed = true;
                    rep110.itemAt(column).radius = 1.0;
                    rep110.itemAt(column).ratio = 1.0;
                }
            }
            /* resistor values are stored in this repeater */
            /*  0 = black,
                1 = brown,
                2 = red,
                3 = orange,
                4 = yellow,
                5 = green,
                6 = blue,
                7 = violet,
                8 = grey,
                9 = white
                -1 = gold
                -2 = silver */
            Repeater {
                id : storevalues
                model : column.rings
                Item {
                    property int val: 0
                }
            }
            Text {
                id : transpcolor
                color : "transparent"
            }

            function valueset(colorr,index) {

                var i = 0;
                var color = "" + colorr
                switch (color) {
                case "#000000" : i = 0; /* black */
                    break;
                case "#854928" : i = 1; /* brown */
                    //console.log("brown");
                    break;
                case "#ff0000" : i = 2;
                    //console.log("red") /* red */
                    break;
                case "#ff9900" : i = 3; /* orange */
                    break;
                case "#ffff00" : i = 4; /* yellow */
                    break;
                case "#008000" : i = 5; /* green */
                    break;
                case "#0000ff" : i = 6; /* blue */
                    break;
                case "#ee82ee" : i = 7; /* violett */
                    break;
                case "#808080" : i = 8; /* grey */
                    break;
                case "#ffffff" : i = 9; /* white */
                    break;
                case "#ffd700" : i = -1; /* gold */
                    break;
                case "#c0c0c0" : i = -2; /* silver */
                    break;
                default :
                    break;
                }
                storevalues.itemAt(index).val = i;
                //console.log("index:" + index + " color: " + color + " value: " + storevalues.itemAt(index).val);
                column.ohmvalue = "";
                for (var i = 0; i < column.rings; i++) {
                    column.ohmvalue += storevalues.itemAt(i).val;
                }

            }
            function clickhandler(color,index,row) {
                if (color !== transpcolor.color) {
                    column.clearcolumn(index);
                    column.valueset(color,index);
                    column.updateval()
                    column.setcolor()
                    column.setpositions()
                    row.itemAt(index).dimmed = false;
                    row.itemAt(index).ratio = 0.0;
                    row.itemAt(index).radius = 10.0;
                }
            }
            function getunitprefix() {
                var val = 0;
                if (column.rings === 3 || column.rings === 4) {
                    val = storevalues.itemAt(2).val;
                    switch (val) {
                    case 0 : return ""
                    case 1 : return "0"
                    case 2 : return "k"
                    case 3 : return "k"
                    case 4 : return "0k"
                    case 5 : return "M"
                    case 6 : return "M"
                    case 7 : return "0M"
                    case 8 : return "00M"
                    case 9 : return "000M"
                    case -1 : return ""
                    case -2 : return ""
                    default : return ""
                    }
                } else if (column.rings === 5 || column.rings === 6) {
                    val = storevalues.itemAt(3).val;
                    switch (val) {
                    case 0 : return ""
                    case 1 : return "k"
                    case 2 : return "k"
                    case 3 : return "k"
                    case 4 : return "M"
                    case 5 : return "M"
                    case 6 : return "M"
                    case 7 : return "0M"
                    case 8 : return "00M"
                    case 9 : return "000M"
                    case -1 : return ""
                    case -2 : return ""
                    default : return ""
                    }
                } else {
                    return "";
                }


            }
            function valuehandler() {
                var tmp = 0;
                if (column.rings === 3 || column.rings === 4) {
                    tmp = (storevalues.itemAt(0).val *10) + storevalues.itemAt(1).val;
                    //console.log("tmp: " + tmp)
                    switch (storevalues.itemAt(2).val) {
                    case 2 : tmp = tmp / 10;
                        break;
                    case 5 : tmp = tmp / 10;
                        break;
                    case -1 : tmp = tmp / 10;
                        break;
                    case -2 : tmp = tmp / 100;
                        break;
                    default : break
                    }
                    column.calcohm = tmp;
                }
                if (column.rings === 5 || column.rings === 6) {
                    tmp = (storevalues.itemAt(0).val *100) + (storevalues.itemAt(1).val*10) + storevalues.itemAt(2).val;
                    //console.log("tmp: " + tmp)
                    switch (storevalues.itemAt(3).val) {
                    case 1 : tmp = tmp / 100;
                        break;
                    case 2 : tmp = tmp / 10;
                        break;
                    case 4 : tmp = tmp / 100;
                        break;
                    case 5 : tmp = tmp / 10;
                        break;
                    case -1 : tmp = tmp / 10;
                        break;
                    case -2 : tmp = tmp / 100;
                        break;
                    default : break
                    }
                    column.calcohm = tmp;
                }

            }

            function getprecision() {
                if (column.rings === 3 ) {
                    return "± 20%";
                }
                if (column.rings === 4) {
                    switch (storevalues.itemAt(3).val) {
                    case -2 : return "± 10%"
                    case -1 : return "± 5%"
                    case 1 : return "± 1%"
                    case 2 : return "± 2%"
                    case 5 : return "± 0.5%"
                    case 6 : return "± 0.25%"
                    case 7 : return "± 0.1%"
                    case 8 : return "± 0.05%"
                    default : return ""
                    }
                }
                if (column.rings === 5 || column.rings === 6) {
                    switch (storevalues.itemAt(4).val) {
                    case -2 : return "± 10%"
                    case -1 : return "± 5%"
                    case 1 : return "± 1%"
                    case 2 : return "± 2%"
                    case 5 : return "± 0.5%"
                    case 6 : return "± 0.25%"
                    case 7 : return "± 0.1%"
                    case 8 : return "± 0.05%"
                    default : return ""
                    }
                }
            }

            function getTempKoeff() {
                if (column.rings === 6) {
                    switch (storevalues.itemAt(5).val) {
                    case 0 : return "250 ppm/K";
                    case 1 : return "100 ppm/K";
                    case 2 : return "50 ppm/K";
                    case 3 : return "15 ppm/K";
                    case 4 : return "25 ppm/K";
                    case 5 : return "20 ppm/K";
                    case 6 : return "10 ppm/K";
                    case 7 : return "5 ppm/K";
                    case 8 : return "1 ppm/K";
                    default : return "";
                    }

                } else {
                    return "";
                }
            }


            function updateval() {
                column.valuehandler();
                column.ohmvalue = column.getunitprefix() + " Ω " + column.getprecision() + " " + column.getTempKoeff();
                ohmlabel.text = column.calcohm + column.ohmvalue;
            }


            Row { /* row 1, Black Colorvalue */
                id : row0
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater black GlassItem */
                    id : rep00
                    model : column.rings
                    onModelChanged: column.updateRow1(rep00)
                    GlassItem { /* black GlassItem */
                        color : "#000000"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row0.width / column.rings
                        MouseArea {
                            id : buttonMouseArea00
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep00)
                        }
                    }
                    //Component.onCompleted: column.updateRow1(rep00)
                }
            }

            Row { /* row 2, Brown Colorvalue */
                id : row1
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater {
                    id : rep10
                    model : (column.rings)
                    GlassItem {
                        color : "#854928" /* brown */
                        cache: false
                        dimmed : column.defaultdimm
                        width: row1.width / column.rings
                        MouseArea {
                            id : buttonMouseArea10
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep10)
                        }
                    }
                }
            }
            Row { /* row 3, Red Colorvalue */
                id : row2
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater {
                    id : rep20
                    model : (column.rings)
                    GlassItem {
                        color : "#ff0000"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row2.width / column.rings
                        MouseArea {
                            id : buttonMouseArea20
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep20)
                        }
                    }
                }
            }
            Row { /* row 4, Orange Colorvalue */
                id : row3
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater orange */
                    id : rep30
                    model : column.rings
                    onModelChanged: column.updateRow4_5(rep30)
                    Component.onCompleted: column.updateRow4_5(rep30)

                    GlassItem {
                        color : "#ff9900" /* orange*/
                        cache: false
                        dimmed : column.defaultdimm
                        width: row3.width / column.rings
                        MouseArea {
                            id : buttonMouseArea30
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep30)
                        }
                    }
                }
            }
            Row { /* row 5, Yellow Colorvalue */
                id : row4
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, yellow */
                    id : rep40
                    model : (column.rings)
                    onModelChanged: column.updateRow4_5(rep40)
                    Component.onCompleted: column.updateRow4_5(rep40)
                    GlassItem {
                        color : "#ffff00"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row4.width / column.rings
                        MouseArea {
                            id : buttonMouseArea40
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep40)
                        }
                    }
                }
            }
            Row { /* row 6, Green Colorvalue */
                id : row5
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater green */
                    id : rep50
                    model : (column.rings)
                    GlassItem {
                        color : "#008000"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row5.width / column.rings
                        MouseArea {
                            id : buttonMouseArea50
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep50)
                        }
                    }
                }
            }
            Row { /* row 7, Blue Colorvalue */
                id : row6
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, blue */
                    id : rep60
                    model : (column.rings)
                    GlassItem {
                        color : "#0000ff"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row6.width / column.rings
                        MouseArea {
                            id : buttonMouseArea60
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep60)
                        }
                    }
                }
            }
            Row { /* row 8, Violet Colorvalue */
                id : row7
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, violet */
                    id :rep70
                    model : (column.rings)
                    GlassItem {
                        color : "#ee82ee"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row7.width / column.rings
                        MouseArea {
                            id : buttonMouseArea70
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep70)
                        }
                    }
                }
            }
            Row { /* row 9, Grey Colorvalue */
                id : row8
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, grey */
                    id : rep80
                    model : (column.rings)
                    GlassItem {
                        color : "#808080"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row8.width / column.rings
                        MouseArea {
                            id : buttonMouseArea80
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep80)
                        }
                    }
                }
            }
            Row { /* row 10, White Colorvalue */
                id : row9
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, white */
                    id : rep90
                    model : (column.rings)
                    onModelChanged: column.updateRow9(rep90)
                    Component.onCompleted: column.updateRow9(rep90)
                    GlassItem {
                        color : "#ffffff"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row9.width / column.rings
                        MouseArea {
                            id : buttonMouseArea90
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep90)
                        }
                    }
                }
            }
            Row { /* row 11, Gold Colorvalue */
                id : row10
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, gold */
                    id : rep100
                    model : (column.rings)
                    onModelChanged: column.updateRow10_11(rep100)
                    Component.onCompleted: column.updateRow10_11(rep100)
                    GlassItem {
                        color : "#ffd700"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row10.width / column.rings
                        MouseArea {
                            id : buttonMouseArea100
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep100)
                        }
                    }
                }
            }
            Row { /* row 12, Silver Colorvalue */
                id : row11
                height: column.dotspace
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                Repeater { /* repeater, silver */
                    id : rep110
                    model : (column.rings)
                    onModelChanged: column.updateRow10_11(rep110)
                    Component.onCompleted: column.updateRow10_11(rep110)
                    GlassItem {
                        color : "#c0c0c0"
                        cache: false
                        dimmed : column.defaultdimm
                        width: row11.width / column.rings
                        MouseArea {
                            id : buttonMouseArea110
                            anchors.fill : parent
                            onClicked: column.clickhandler(color,index,rep110)
                        }
                    }

                }
            }

            //            Slider {
            //                id: userSlider
            //                width: page.width - Theme.paddingLarge *2
            //                anchors.horizontalCenter: parent.horizontalCenter
            //                stepSize: 1
            //                value: 4
            //                minimumValue: 3
            //                maximumValue: 6

            ////                onValueChanged: {
            ////                    console.log("value is now: " + value)

            ////                }
            //            }
            //            Label {
            //                text : "Number of Rings: " + column.rings
            //                font.pixelSize: Theme.fontSizeExtraSmall / 1.5
            //                anchors {
            //                    horizontalCenter: parent.horizontalCenter
            //                }
            //            }
            PushUpMenu {
                MenuItem {
                    text: qsTr("Use 3 Rings")
                    onClicked: column.rings = 3;
                }
                MenuItem {
                    text: qsTr("Use 4 Rings")
                    onClicked: column.rings = 4;
                }
                MenuItem {
                    text: qsTr("Use 5 Rings")
                    onClicked: column.rings = 5;
                }
                MenuItem {
                    text: qsTr("Use 6 Rings")
                    onClicked: column.rings = 6;
                }
            }
        }
    }

}
