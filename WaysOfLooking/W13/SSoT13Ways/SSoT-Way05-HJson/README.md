# HJson

The HJson is formatted similarly to JSON but without all the "" marks around the names.  This generally makes it easier to read.  This is a simple description of the standard game in HJson format.  

The hjson format is simple and easy to readme.  It updates the single source of truth with these commands:

```
aicapture -replay hjson-to-xml-i rules.hjson
aireplay xml-xslt-transform -i rules.hjson.xml -i CreateSSoT.xslt
aireplay xml-to-json -i single-source-of-truth.xml -o ../SSoT/single-source-of-truth.json
```
