# YAML v2.0

## Concise YAML

In this version of YAML - rather than having each shape described in detail, the shapes are simply named as s1, s2, s3, s4, etc.

Then - there are parameters for the following formula:

`s1=floor(max_pt/initial_divider), s{index} = s1 + (increment * {index} * (alternate ? -1 or 1)), s3 = s1 + (...)...`

In this way - the first shape is assigned the maximum number of points allowable per round, divided by an initial divider.  Then, the number of points assigned to each shape is it's index multiplied by an increment.

Additionally, if "alternate" is set to true, then each subsequent shape will have the incremented score added, and then subtracted, and then added, etc.

In this way, a wide variety of scores can be assigned, without having to individual set/configure each score/shape.

The shape codes are also automatically assigned, with the player getting the uppercase version of the first letter of the shape name, and the opponent getting the lowercase version of that shape name.

### List of Rules Followed
 - Shape codes are based on the first letter of the shape name
 - Player gets uppercase, opponent lowercase letter
 - Because of this - all shapes must start with a unique letter of the alphabet
 - The win score is the max score, minus the max shape score
 - the loss score is always 0
 - the draw score is half the win score



### What is YAML

The yaml format is simple and easy to readme.  It updates the single source of truth with these commands:

```
aireplay yaml-to-json -i rules.yaml
aireplay json-to-xml -i rules.json
aireplay xml-xslt-transform -i rules.xml -i CreateSSoT.xslt
aireplay xml-to-json -i single-source-of-truth.xml -o ../SSoT/single-source-of-truth.json
```

The main protocol of the YAML syntax - is that it does NOT specify what beats what.  Instead, it is assumed that this can be inferred from the order.  This is also true of the test cases which will simple test ever case.