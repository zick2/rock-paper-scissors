using System;
using System.Text;

namespace ObjectOrientedConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Game game = new Game("Example Game");
            game.rounds.Add(new GameRound('Y', 'A'));
            game.rounds.Add(new GameRound('X', 'B'));
            game.rounds.Add(new GameRound('Z', 'C'));

            game.PlayGame();

            Console.WriteLine("Game Name: " + game.Name);
            Console.WriteLine("Total Score: " + game.Score);
        }
    }
}