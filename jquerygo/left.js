//var config1 =  require('nconf');
//config1.argv().env();
//var url1 = config1.get('s');
var arguments = process.argv.slice(2);
//console.log(arguments[0]);



var $ = require('jquerygo');

// Visit the user path and log in.
//
var site = arguments[0];
//'http://www.goethe-verlag.com/book2/EM/EMIT/EMIT008.HTM';
$.visit(site, function() {

    // Get the title.
    var b='#sn_0 > a';
    var a='.Stil35';
    var c="a , tr~ tr+ tr .Stil35";
    var d='.Stil45'
    var e='a:nth-child(2)'
    var f='.Stil45 div:nth-child(2)'
    var g='.col-md-12 .Stil35'
    $(b).click(function(){
        $(g).text(function(text) {
            console.log(text);
            $.close();
        });
    });

});
