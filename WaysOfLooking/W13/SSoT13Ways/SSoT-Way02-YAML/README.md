# YAML Formatted Rock, Paper, Scissors v1.0
The yaml format is simple and easy to readme.  It updates the single source of truth with these commands:

```
aireplay yaml-to-json -i rules.yaml
aireplay json-to-xml -i rules.json
aireplay xml-xslt-transform -i rules.xml -i CreateSSoT.xslt
aireplay xml-to-json -i single-source-of-truth.xml -o ../SSoT/single-source-of-truth.json
```

## Input Lanauge Rules

The main nuance of the YAML protocol syntax, is that it does NOT specify what beats what.  Instead, it is assumed that this can be inferred from the order.  This is also true of the test cases which will simple test every use case.
