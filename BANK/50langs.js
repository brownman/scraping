//http://docs.casperjs.org/en/latest/quickstart.html#a-minimal-scraping-script

// googletesting.js
var links = [];
var casper = require('casper').create();


function getLinks() {
    var links = document.querySelectorAll('.style2 , td.Stil39:nth-child(1)');
    return links;
    /*
    return Array.prototype.map.call(links, function(e) {
        return e.getAttribute('href');
    });
    */
}
casper.start('http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM', function() {
    // search for 'casperjs' from google form
 //   this.fill('form[action="/search"]', { q: 'casperjs' }, true);
 var nothing;
});

casper.then(function() {
    // aggregate results for the 'casperjs' search
    links = this.evaluate(getLinks);
    // now search for 'phantomjs' by filling the form again
   // this.fill('form[action="/search"]', { q: 'phantomjs' }, true);
   
});

casper.then(function() {
    // aggregate results for the 'phantomjs' search
    links = links.concat(this.evaluate(getLinks));
});

casper.run(function() {
    // echo results in some pretty fashion
    this.echo(links.length + ' links found:');
    this.echo(' - ' + links.join('\n - ')).exit();
});
