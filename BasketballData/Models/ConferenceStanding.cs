using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class ConferenceStanding
    {
        public string TeamName { get; }
        public int Wins { get; }
        public int Losses { get; }
        public double WinPercentage { get; }

        internal ConferenceStanding(string name, int wins, int losses, double winPercentage)
        {
            TeamName = name;
            Wins = wins;
            Losses = losses;
            WinPercentage = Math.Round(winPercentage, 2);
        }
    }
}
