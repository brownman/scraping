system = require("system")
casper = require("casper").create()
format = require("utils").format
source = "en"

#casper.cli.get('source') || 'auto',
target = "fr"

#casper.cli.get('target'),
text = "water"

#casper.cli.get(0),
result = `undefined`
 
casper.options.stepTimeout = 10000 #timeout > 0 ? timeout : 1000;
 
casper.warn("The --target option is mandatory.").exit 1  unless target
casper.start(format("http://translate.google.com/#%s/%s/%s", source, target, text), ->
  @fill "form#gt-form",
    text: text

).waitForSelector "span.hps", (->
 
  @echo @getHTML("div#gt-res-dict")
 
), null, 30000
casper.run()
