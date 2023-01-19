# 13 ways of Looking at Rock, Paper, Scissors

## Introduction
This repo is an omage to both 13 ways of looking at a turtle (https://fsharpforfunandprofit.com/posts/13-ways-of-looking-at-a-turtle/), and Advent of Code (https://adventofcode.com/2022/day/2) by creating 13 ways of looking at the game Rock, Paper, Scissors.

This repository is an omage to Scott Wlashin's article "13 ways of looking at a turtle", and the annual Advent of Code challenge (https://adventofcode.com/2022/day/2). 

The challenge used in this repository is the Rock, Paper, Scissors game from the 2022 Advent of Code day 2 prompt. The goal of the repository is to explore 13 different approaches to implementing the challenge, using various programming languages and techniques including C#, F#, Python, C++, JavaScript, TypeScript, D3 Visualizations, English README documentation and many more. 

## Actually 2 ways of looking at 13 ways....
The "real" purpose of pulling the same problem apart 13 different ways is to demonstrate that there are 2 VERY different kinds of code. So almost 100% of the code in this repository was utlimately written by ChatGPT, and for each way of looking at the game, ChatGPT was actually asked to write the code in 3 different styles. 

The first approach was just asking ChatGPT to give us a fish, where the prompt was given and the solution was provided in various programming languages like C#, F#, Python, C++, JavaScript and more. 

I went through all 13 ways, and over, and over again, I asked ChatGPT for a fish.  First a C# fish.  Then an F# fish.  I call them "Concrete Fish" because it is a fish that represents a **specific set of choices** for how to solve the prompt, in the **concrete syntax** of a **specific language**.  English, C#, F#, Python, C++, JavaScript, OOP, D3 Visualization, Unit Tests, Documentation, Visual Basic, Golang and more.  So many different fish.

At the end of 13 sessions with ChatGPT, I had 13 Concrete Fish, in 13 different languages.

The 2nd and 3rd styles involved asking ChatGPT to actually teach us how to fish - by providing reusable tools that can do the work we want now, and in the future, on-demand, without the need for ChatGPT's involvment on an ongoing basis.  

This was accomplished using AI Capture.

Now, for this to work, before any fish are provided, we start by asking ChatGPT to explain how it actually "thinks about" / "understands the problem".  It shares it's own "knowledge graph" in a language agnostic format that AI Capture can save.

With this "Knowledge Graph" in hand, we can now ask ChatGPT to teach us, by explaining to us how wrote the code, relative to that Knowledge Graph.  Logistically, in practice, it actually does this by writing a tool to do it, or redo it any time it's needed.  

This code that ChatGPt writes explaining it's own thinking, can then be captured by AI Capture - and replayed on demand, at any time in the future. 

So now, whenever the facts on the ground change, we can simply re-apply that knowledge again. This creates a much more general solution and can be applied to multiple different scenarios. 

We'll explore 13 here.

## How does this actually work?
In the world of coding and problem-solving, the analogy of "giving a man a fish versus teaching him to fish" is particularly relevant. 

Giving someone a fish, in this context, means providing them with a specific solution to a problem, while teaching them to fish means providing them with the tools and knowledge they need to solve similar problems on their own in the future. 

ChatGPT can easily give you a fish, but the problem is that while often the fish is great, sometimes it's rotten, or it's such a big fish that ChatGPT gets 50% through the code and just stops.

Having it give us fishing poles that let us fish for the code ourselves is much more dynamic and flexible.

In this section, we will explore the concept of "fish" vs. "fishing poles" in more detail.

First, we will delve into the idea of "fish," which are specific solutions to problems that are based on a set of rules and conditions, provided in the concrete syntax of a specific language. They're basically "Concrete Fish".  As a result of this, these solutions are often brittle and inflexible, and may not adapt well to changes in the rules or conditions. 

In contrast, we will then discuss the idea of having ChatGPT first create a "knowledge graph" or "single source of truth" for the problem, and using that knowledge to create tools that are dramatically more adaptable and flexible to changes. 

This approach allows for more dynamic and efficient problem-solving, akin to giving you a fishing pole instead of a fish.

### ChatGPT - please teach me how to fish!
In order for ChatGPT to "teach us how to fish", we first have to understand something that was not necessary - or documented during the first 13 sessions - and that is this:

How do you, chat GPT understand the prompt I've given you?

In other words, before we start writing code in a specific language, we might as ChatGPT:

Prompt: Please tell me YOUR understanding of the Rock Paper Scissors code challenge?

This is obviously right in ChatGPT's wheel house and so it can easily spin off a few paragraphs explaing the game in it's own words.

But then, you can do something interesting - you can ask it to give you those rules in a Json Format.  What we end up with (included below) Is rock-paper-scissors.json - basically a DATABASE with all of the rules from the prompt.  THe lists of the chapes, their codes, their scores, the outcomes of the games, the example game and what the expected outcomes are (helpful for automated united testing).  Basically - all of the important details from the initial english prompt - but in a format that will easily be accessible from all 13 ways, as well as virtually any OTHER way that we might come up with.

So - for the 2nd round of questions - the prompt to ChatGPT is a little different.

Now - we can paste into the original prompt:
    1) The original english prompt
    2) the json "Single source of truth" that is just a machine readable list of the rules.
    3) Finally (and most importantly) we can ChatGPT THIS question:

Assuming that you have this Json set of specific shapes, codes, rules etc, can you please write me a C# program that calculate the answer to the sample game provided (and find the number 15).

Add it turns out that ChatGPT can do this JUST as effortlessly, with a couple of REALLY key observations about the 2nd kind of code.

1) When the rules change, the concrete fish that was based on all of the specific rules in the original prompt will all keep those original values in concrete.  So even if we change ABC to DEF - the concrete fish will still all show ABC - because those values were essentially etched in stone.

2) ALl of the dynamic fish that are simply iterating over the collection of shapes in a JSON file provided at RUN time will continue to do so even if the names, or codes, or scores of those fish change, or even if we go from have 3 shapes to have 20.  Becuase the code in this dynamic version doesn't ever mention ROCKS or A or X or Z.  It will tend to be code that reads more like this:

var json = LoadJson("rps-rules.json")

player_wins(opp_code, player_code)
    if (json[shapes[matching player_code]/wins_against] == opp_code) return true
    else return false

player_loses(opp_code, player_code)
    if (json[shapes[matching opp_code]/wins_against] == player_code) return true
    else return false

As you can see - this code is completely decoupled from the specific shapes or codes.  It describes how ... RELATIVE TO an external model of the rules ... to solve the problem.  And so as the names/codes/scores or even complete lists of the shapes change - THIS Code will just "follow allong" where the brittle, concrete code will unsurprisingly, immediately start to crack and fall appart.

3B - Please give me a fishing poll that I can use to fish for myself.

The 3rd approach that I used with ChatGPT that can work on it's own in a variety of ways, but which AI Capture is specifically designed to help with - we can actually ask ChatGPT to write a tool for us.

So - now that we have a Json model for the problem (Which ChatGPT provided for us) - we can now ask it a question that we otherwise would not be able to:

1) We can give it a prompt and have it write some code for us
2) Since we now also have a reliable, machine readable model, we can ask ChatGPT the following:

Here is some code you wrote: [code goes here]
Here is an Json description of the rules that the code is based on: [rock-paper-scissors.json goes here]
Please Write me a tool that, given that Json as Input, can produce the original code you wrote.

AI Capture then captures the code written by ChatGPT, and AI Reply can then re-generate that code, reliably, on demand, any time in the future, even if ChatGPT is offline.  ChatGPT basically gives AI Capture a fishing pole that, given the Json file as input can reliably produce the code in question.

That ways - as the rules change, and the json grows, and changes and evolves over time, we should always be able to just get out our C# fishing pole, or our Python fishing pole, and Re-generate the output.

The last set of 13 projects are all fishing polls.  C#, F#, Python etc fishing poles that all faithfully re-create the original concrete fish - except now, because they are also written relative to the single source of truth, they also all follow along.

section 4

So there are 39 unit tests. 13 that test the concrete fish, 13 that test the dynamic fish, and 13 that test the fishing poles.

All 39 start by passing (i.e. they all find 8 points after a win, 1 point after a loss, and 6 points after a draw for a total of 15 points)

But then, as soon as we change ANY of the actual details, i.e. renaming a shape or changing any of the codes or scores used - and immediately the 13 concrete fish tests start to fail.  But the other 26 tests all continue to pass.  This is because the unit tests themselves are dynamic and all immediately start testing the new rules.

So, we can actually replace the entire single source of truth, and replace ROck, Paper, Scissors with a Star Trek Themed "Phaser, Shield, EMP, Transporter" - that changes every name, code, score, outcome score and even the number of shapes involved.  almost 50 files in the repository have to be "adjusted" to follow along - but all 26 dynamic projects, along with all 39 unit tests do so - and now all compute a test score of 47.


seciton 5
this is an option source repo - because I hope that I will get pull requests for a 14th, 15th, 16th way, etc.

My hope is that the repo will just continue to grow over time.

section 4
# 13 Ways of Looking

## Way 01 - 

## Way 02 -

## Way 03 -

section 5
# Rock, Paper, Scissors
The Elves begin to set up camp on the beach. To decide whose tent gets to be closest to the snack storage, a giant Rock Paper Scissors tournament is already in progress.

Rock Paper Scissors is a game between two players. Each game contains many rounds; in each round, the players each simultaneously choose one of Rock, Paper, or Scissors using a hand shape. Then, a winner for that round is selected: Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock. If both players choose the same shape, the round instead ends in a draw.

## The Rules

Appreciative of your help yesterday, one Elf gives you an encrypted strategy guide (your puzzle input) that they say will be sure to help you win. "The first column is what your opponent is going to play: A for Rock, B for Paper, and C for Scissors. The second column--" Suddenly, the Elf is called away to help with someone's tent.

The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors. Winning every time would be suspicious, so the responses must have been carefully chosen.

The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).

## Example Game

Since you can't be sure if the Elf is trying to help you or trick you, you should calculate the score you would get if you were to follow the strategy guide.

For example, suppose you were given the following strategy guide:
```
A Y
B X
C Z
```
This strategy guide predicts and recommends the following:

In the first round, your opponent will choose Rock (A), and you should choose Paper (Y). This ends in a win for you with a score of 8 (2 because you chose Paper + 6 because you won).
In the second round, your opponent will choose Paper (B), and you should choose Rock (X). This ends in a loss for you with a score of 1 (1 + 0).
The third round is a draw with both players choosing Scissors, giving you a score of 3 + 3 = 6.
In this example, if you were to follow the strategy guide, you would get a total score of 15 (8 + 1 + 6).

What would your total score be if everything goes exactly according to your strategy guide?