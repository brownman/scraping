var $ = require('jquerygo');


var xpath1 = function(STR_XPATH) {
    var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
    var xnodes = [];
    var xres;
    while (xres = xresult.iterateNext()) {
        xnodes.push(xres);
    }

    return xnodes;
}



// Add some default configs.
$.config.site = 'http://www.goethe-verlag.com/book2/EM/EMIT/EMIT008.HTM';
$.config.addJQuery = true;

// Using the async.series with jQuery.go.
//$.go('visit', '/user'),
///$('#edit-name').go('val', 'admin'),
///$('#edit-pass').go('val', '123testing'),
//$('#edit-submit').go('click'),


var selector0='//*[@id="sn_0"]/a';
var a = $()//xpath1(selector0);
console.log(a)
    $(a).click(function(){

        //    console.log(page.content);
        //    //*[@id="sn_0"]/a
        // $('a').click():
        var selector1='a'
        //tr+ tr .Stil35'
        //'.Stil35';

        var res=$(selector1).text();
    console.log(res);
    })


// Make sure that the logout link is shown.
//            $('a[href="/user/logout"]').text(function(text) {
//              console.log(text);
//            done();
//      });
// }
