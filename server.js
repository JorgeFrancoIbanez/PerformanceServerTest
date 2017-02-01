var exec = require('child_process').exec;
var os = require('os');
var request = require('request');
var express = require("express");

var app = express();

var extIp;

request.get('http://ipinfo.io/json',function(err,res,body){
  if (!err && res.statusCode == 200) {
     extIP = JSON.parse(body);
  }
});

/* serves main page */
app.get("/", function(req, res) {
    // res.sendfile('index.htm')
    res.json({
        host: os.hostname(),
        arch: os.arch(),
        os: os.type(),
        patform: os.platform(),
        release: os.release(),
        uptime: os.uptime(),
        platform: os.platform(),
        network: os.networkInterfaces(),
        cpu: os.cpus(),
        totalmem : os.totalmem(),
        loadavg: os.loadavg(),
        freemem: os.freemem(),
        extip: extIP});
    // res.sendfile('index.htm')
});

app.get("/host", function(req, res) {
    res.json({hostname: os.hostname()});
});

app.get("/mem", function(req, res) {
    res.json({freemem : os.freemem()});
});

app.get("/cpu", function(req, res) {
    res.json({cpus : os.cpus()});
});

app.get("/uptime", function(req, res) {
    res.json({uptime : os.uptime()});
});

app.get("/getpi", function(req, res) {
    iters = Math.min(req.query.iters || 1000 ,10000000000);
    console.log(iters);
    res.json({
        pi : getPi(iters),
        loadavg: os.loadavg(),
        hostname: os.hostname(),
        ip: os.networkInterfaces().eth0[0].address
    });
});

app.get("/load", function(req, res) {
    res.json({
        loadavg: os.loadavg(),
        hostname: os.hostname(),
        ip: os.networkInterfaces().eth0[0].address
    });
});

app.post("/stress", function(req, res) {
    var load = Math.max(Math.min(Number(req.query.load || 0) ,100), 0) ;
    var timeout = Math.max(Math.min(Number(req.query.timeout || 0) ,100000), 0) ;
    var command = "/home/ubuntu/stress-ng-0.09.04/stress-ng -c 0 -l " + load + ((timeout>0 )?(" -t " + timeout):"");

    res.json({
        command : command,
        loadavg: os.loadavg(),
        hostname: os.hostname(),
        ip: os.networkInterfaces().eth0[0].address
    });

    // Kill existing stressors

    killStressors(function(){
        if(load > 0 ) {startStressor(command);}
    });

});

function killStressors(mycb){
    console.log('Killing Stressors');
    exec("kill $(pgrep stress-ng)", function(error, stdout, stderr){
        // logresponse(error, stdout, stderr);
        mycb();
    });
}

function startStressor(command){
    console.log('Starting Stressors');
    console.log('COMMAND:', command);
    exec(command, logresponse);
}

// /* serves all the static files */
// app.get(/^(.+)$/, function(req, res){
//     console.log('static file request : ' + req.params);
//     res.sendfile( __dirname + req.params[0]);
// });

function logresponse(error, stdout, stderr) {
    if(error) console.log('ERROR:', error);
    if(stdout) console.log('STDOUT:', stdout);
    if(stderr) console.log('STDERR:', stderr);
}

function getPi(iters){
    var sum = 0;
    for(var n = 0; n < iters; n++){
        var mult = (n%2 === 0) ? 1 : -1; // -1^n
        sum += mult * (1 / (2*n+1));
        // console.log(sum * 4)
    }
    return sum * 4; // to get pi
}

app.listen(80, function() {
   console.log("Listening on port 80");
});
