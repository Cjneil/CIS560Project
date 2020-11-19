using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class Player
    {
        public int PlayerId { get; }
        public string TeamName { get; }
        public string FirstName { get; }
        public string LastName { get; }
        public string Position { get; }
        public double MinutesPerGame { get; }
        public double PointsPerGame { get; }
        public double AssistsPerGame { get; }
        public double ReboundsPerGame { get; }
        public double BlocksPerGame { get; }
        public double StealsPerGame { get; }
        public double TurnoversPerGame { get; }

        internal Player(int playerId, string teamName, string firstName, string lastName, string position)
        {
            PlayerId = playerId;
            TeamName = teamName;
            FirstName = firstName;
            LastName = lastName;
            Position = position;
        }
        internal Player(string teamName, string firstName, string lastName, string position, double minutes,
            double points, double assists, double rebounds, double steals, double blocks, double turnovers)
        {
            TeamName = teamName;
            FirstName = firstName;
            LastName = lastName;
            Position = position;
            MinutesPerGame = minutes;
            PointsPerGame = points;
            AssistsPerGame = assists;
            ReboundsPerGame = rebounds;
            BlocksPerGame = blocks;
            StealsPerGame = steals;
            TurnoversPerGame = turnovers;
        }
    }
}
