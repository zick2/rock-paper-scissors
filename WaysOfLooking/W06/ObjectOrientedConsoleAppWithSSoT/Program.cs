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

            var rock = new Rock();

            game.PlayGame();

            Console.WriteLine("Total Score: " + game.Score);
        }
    }
}