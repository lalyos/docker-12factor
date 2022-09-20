var fs = require('fs');
var STORAGE = "/tmp/fail"

function version(r) {
    r.return(200, "v1.0.0");
}

function push(r) {
    fs.appendFileSync(STORAGE, r.requestBody);
    r.return(200);
}

function set(r) {
    fs.writeFileSync(STORAGE, r.args.count);
    r.return(200);
}

function ready(r) {
    var data = "";
    try {
        data = fs.readFileSync(STORAGE);
    } catch (e) {
    }

    var num = parseInt(data)
    if (num > 0) {
        num = num - 1;
        fs.writeFileSync(STORAGE, num);    
        r.return(500, "failure remains:" + num);
    }
    r.return(200, "OK\n");
}

function flush(r) {
    fs.writeFileSync(STORAGE, "");
    r.return(200);
}

function read(r) {
    var data = "";
    try {
        data = fs.readFileSync(STORAGE);
    } catch (e) {
    }

    r.return(200, data);
}

export default {push, set, flush, read, ready, version};