//refs
//http://stackoverflow.com/questions/6453269/jquery-select-element-by-xpath
//
// Read the Phantom webpage '#intro' element text using jQuery and "includeJs"
var fs = require('fs'),
    system = require('system');
//var num  = system.args.length;


//var url1='http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM';
var arg = system.args[1];
console.log('arg: ' + arg);
//phantom.exit();

//var url1='http://www.goethe-verlag.com/book2/EM/EMIT/EMIT003.HTM'

var url1=arg; 
//'http://www.goethe-verlag.com/book2/EM/EMIT/EMIT0' + arg + '.HTM'
var page = require('webpage').create();


page.onConsoleMessage = function(msg) {
    console.log(msg);
};

page.open(url1, function(status) 
        {

            var xpath1 = function(STR_XPATH) {
                var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
                var xnodes = [];
                var xres;
                while (xres = xresult.iterateNext()) {
                    xnodes.push(xres);
                }

                return xnodes;
            }


            if ( status === "success" ) 
{       
    page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() 
        {
            page.evaluate(function()
                {


                    var selector0='//*[@id="sn_0"]/a';
                    var a = xpath1(selector0);
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

                });
            phantom.exit()
        });
};
});

/*
   page.open("http://www.phantomjs.org", function(status) {
   if ( status === "success" ) {
   page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
   var content = page.content;
   console.log('Content: ' + content);

   page.evaluate(function() {
   console.log("$(\".explanation\").text() -> " + $(".explanation").text());
   });
// phantom.exit();
});
}
});
*/
