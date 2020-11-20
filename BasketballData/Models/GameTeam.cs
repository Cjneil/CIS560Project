using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class GameTeam
    {
        public DateTime Date { get; }
        public string TeamName { get; }
        public string OpponentName { get; }
        public string TeamType { get; }
        public int TeamScore { get; }
        public int OpponentScore { get; }

        internal GameTeam(DateTime date, int teamScore,string teamName, int oppScore, string oppName, int teamTypeId)
        {
            Date = date;
            TeamScore = teamScore;
            TeamName = teamName;
            OpponentScore = oppScore;
            OpponentName = oppName;
            if (teamTypeId == 1)
                TeamType = "Away";
            else
                TeamType = "Home";
        }
    }
}
