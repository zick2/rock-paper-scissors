using System;
using System.ComponentModel;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using CoreLibrary.Extensions;

using System;
            
namespace TWOLAT.RPS.Lib
{
    public static partial class CoreLibraryExtensions 
    {
        public static Shape CreateShape(this Game game, char code)
        {
            switch (code)
            {
                case 'A':
                case 'X':
                    return new Rock();
                case 'B':
                case 'Y':
                    return new Paper();
                case 'C':
                case 'Z':
                    return new Scissors();
                default:
                    throw new ArgumentException("Invalid shape code");
            }
        }     
        
        public static void AddSampleGame(this Game game)
        {
            // win
            game.Games_GameRounds.Add(new GameRound('Y', 'A'));// Paper vs. Rock
            // loss
            game.Games_GameRounds.Add(new GameRound('X', 'B'));// Rock vs. Paper
            // draw
            game.Games_GameRounds.Add(new GameRound('Z', 'C'));// Scissors vs. Scissors
        }
    }

    public partial class Outcome
    {
        public static int WinScore { get => 6; }
        public static int LossScore { get => 0; }
        public static int DrawScore { get => 3; }
    }            
}