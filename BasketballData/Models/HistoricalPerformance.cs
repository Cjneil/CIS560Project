using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class HistoricalPerformance
    {
        public int TeamId { get; }
        public string TeamName { get; }
        public int Wins { get; }
        public int Losses { get; }
        public double WinPercentage { get; }
        public double AveragePoints { get; }

        internal HistoricalPerformance(int teamId, string name, int wins, int losses, double winPercentage, double averagePoints)
        {
            TeamId = teamId;
            TeamName = name;
            Wins = wins;
            Losses = losses;
            WinPercentage = Math.Round(winPercentage, 2);
            AveragePoints = Math.Round(averagePoints, 2);
        }
    }
}
