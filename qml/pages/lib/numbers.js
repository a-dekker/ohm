function parse(str) {
    var n = parseFloat(str);
    var factor = 1;

    switch(str[str.length-1]) {
        // positive prefixes
        case 'k': factor = 1e3;  break;
        case 'M': factor = 1e6;  break;
        case 'G': factor = 1e9;  break;
        case 'T': factor = 1e12; break;
        case 'P': factor = 1e15; break;
        case 'E': factor = 1e18; break;
        case 'Z': factor = 1e21; break;
        case 'Y': factor = 1e24; break;

        // negative prefixes
        case 'm': factor = 1e-3;  break;
        case 'u': factor = 1e-6;  break;
        case 'n': factor = 1e-9;  break;
        case 'p': factor = 1e-12; break;
        case 'f': factor = 1e-15; break;
        case 'a': factor = 1e-18; break;
        case 'z': factor = 1e-21; break;
        case 'y': factor = 1e-24; break;
    }

    return n * factor;
}

function format(f) {
    var n = 0;
    var prePos = "kMGTPEZY";
    var preNeg = "munpfazy";

    var prefix = "";

    if(Math.abs(f) > 1) {
        while(Math.abs(f) > 1000) {
            f /= 1000;
            n++;
        }

        if(n != 0) {
            prefix = prePos[n-1];
        }
    } else {
        while(Math.abs(f) < 1.000) {
            f *= 1000;
            n++;
        }

        if(n != 0) {
            prefix = preNeg[n-1];
        }
    }

    return f.toFixed(3) + prefix;
}

