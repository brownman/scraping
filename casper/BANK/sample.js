//http://docs.casperjs.org/en/latest/quickstart.html#a-minimal-scraping-script

var casper = require('casper').create();

casper.start('http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM', function() {
    this.echo(this.getTitle());
});

 
 
casper.run();
