## ChatGPT Prompt

**NOTE:** This way of looking at RPS required no chat GPT input - because we already have the SSoT - and this repo was able to just leverage existing SSoTme tools to build/maintain this version of the code.

```
ssotme xml-to-odxml -i SSoT/rps.xml 
        -> ODXML/DataSchema.odxml

ssotme odxml-to-csharp-pocos -i ODXML/DataSchema -i 
        -> Game.cs, GameRound.cs, Shape.cs, Outcome.cs, etc.

ssotme xml-xslt-transform -i SSoT/rps.xml -i CreateConcreteClasses.xslt 
        -> Rock.cs, Paper.cs, Scissors.cs
```

Then - I copied the ~100 (of the roughly 400 in the original hand coded version) over to fill in the gaps left by the derived code - which have no idea how to actually play the game.