using System;
using System.Text;
using TWOLAT.RPS.Lib;

namespace ObjectOrientedConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Game game = new Game("Example Game");

            game.AddSampleGame();

            game.PlayGame();

            Console.WriteLine("Game Name: " + game.Name);
            Console.WriteLine("Total Score: " + game.Score);
        }
    }
}