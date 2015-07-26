var $ = require('jquerygo');

// Visit the user path and log in.
//
var site = 'http://www.goethe-verlag.com/book2/EM/EMIT/EMIT008.HTM';
$.visit(site, function() {

    // Get the title.
    var b='#sn_0 > a';
    var a='.Stil35';
    var c="a , tr~ tr+ tr .Stil35";
    var d='.Stil45'
    var e='a:nth-child(2)'
    var f='.Stil45 div:nth-child(2)'
    $(b).click(function(){


        $(f).text(function(text) {
            console.log(text);
            $.close();
        });
    });

});
