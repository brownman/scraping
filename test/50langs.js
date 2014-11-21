// googletesting.js
//https://travis-ci.org/n1k0/casperjs/builds

function getLinks() {
    var links = document.querySelectorAll('.style2 , td.Stil39:nth-child(1)');
     
    return Array.prototype.map.call(links, function(e) {
               return e.text;
//        return e.getAttribute('href');
    });
    
}
casper.test.begin('page should contains 100 lessons', 1, function suite(test) {
    casper.start("http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM", function() {
        test.assertTitle("English US - Italian for beginners – Table of contents", "title is: langX -> langY");
      /*  test.assertExists('form[action="/search"]', "main form is found");
        this.fill('form[action="/search"]', {
            q: "casperjs"
        }, true);
        */
    });

    casper.then(function() {
       // test.assertTitle("casperjs - Recherche Google", "google title is ok");
    //    test.assertUrlMatch(/q=casperjs/, "search term has been submitted");
      /*  test.assertEval(function() {
            return __utils__.findAll(".style2 , td.Stil39:nth-child(1)").length = [];
        }, "prepare an array of all lessons");
        
    });
    */
var arr1 = [];
var arr2 = getLinks();
//documnt.get(".style2 , td.Stil39:nth-child(1)")
    });
    
    
casper.test.assertEquals(arr1, arr2)
    casper.run(function() {
        test.done();
    });
});
