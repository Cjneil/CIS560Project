using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class GamePlayer
    {
        public DateTime Date { get; }
        public string TeamName { get; }
        public string OppTeamName { get; }
        public int Minutes { get; }
        public int Points { get; }
        public int Assists { get; }
        public int Rebounds { get; }
        public int Steals { get; }
        public int Blocks { get; }
        public int Turnovers { get; }

        internal GamePlayer(DateTime date, string teamName, string oppTeamName, int minutes, int points, int assists, int rebounds, int steals, int blocks, int turnovers)
        {
            Date = date;
            TeamName = teamName;
            OppTeamName = oppTeamName;
            Minutes = minutes;
            Points = points;
            Assists = assists;
            Rebounds = rebounds;
            Steals = steals;
            Blocks = blocks;
            Turnovers = turnovers;
        }
    }
}
