var arguments = process.argv.slice(2);
console.log(arguments[0]);

var $ = require('jquerygo');

// Visit the user path and log in.
//
var site = arguments[0];


// Visit the user path and log in.
//
function inner1(){
    var f='.Stil45 span';// div:nth-child(2)';
        $(f).text(function(text) {
            console.log(text);
            $.close();
        });
}

$.visit(site, function() {

    // Get the title.
    var b='#sn_0 > a';
    var a='.Stil35';
    var c="a , tr~ tr+ tr .Stil35";
    var d='.Stil45';
    var e='a:nth-child(2)';

    var elem = $(b);
if( elem ){
    elem.click(inner1)
} else {
    inner1()
}

});
