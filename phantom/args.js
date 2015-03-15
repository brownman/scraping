// echoToFile.js - Write in a given file all the parameters passed on the CLI
var fs = require('fs'),
    system = require('system');
var num  = system.args.length;
if (num < 3) {
    console.log(num + " <-num, Usage: echoToFile.js DESTINATION_FILE <arguments to echo... atleast 2 args>");
    phantom.exit(1);
} else {
    var content = '',
        f = null,
        i;
    for ( i= 2; i < system.args.length; ++i ) {
        content += system.args[i] + (i === system.args.length-1 ? '' : ' ');
    }
    
    try {
        fs.write(system.args[1], content, 'w');
    } catch(e) {
        console.log(e);
    }

    phantom.exit();
}
