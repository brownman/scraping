system = require("system")
casper = require("casper").create()
format = require("utils").format


source = auto
target = fr
text = "hello world"
result = undefined


casper.start(format("http://translate.google.com/#%s/%s/%s", source, target, text), ->
  @fill "form#gt-form", text: text
).waitForSelector "span.hps", -> @echo @fetchText("#result_box")

casper.run()