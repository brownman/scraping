// Read the Phantom webpage '#intro' element text using jQuery and "includeJs"


var page = require('webpage').create();
page.selector='.Stil39 a';
page.url='http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM';

page.onConsoleMessage = function(msg) {
    console.log(msg);
};


page.open("http://www.phantomjs.org", function(status) {
    if ( status === "success" ) {
        page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
            page.evaluate(function() {
                console.log("$(\".explanation\").text() -> " + $(".explanation").text());
            });
           // phantom.exit();
        });
    }
});

var page = require('webpage').create();
page.open(page.url, function() {
  page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
    page.evaluate(function() {
      var something=$(page.selector).text;
      console.log(something);
    });
    phantom.exit()
  });
});
