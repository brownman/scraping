// googletesting.js
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
        test.assertEval(function() {
            return __utils__.findAll(".style2 , td.Stil39:nth-child(1)").length = 100;
        }, "google search for \"casperjs\" retrieves 10 or more results");
    });

    casper.run(function() {
        test.done();
    });
});
