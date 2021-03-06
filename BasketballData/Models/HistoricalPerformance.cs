﻿using System;
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
        public string OppName { get; }
        public int Wins { get; }
        public int Losses { get; }
        public double WinPercentage { get; }
        public double AveragePoints { get; }
        public double AveragePointsOpp { get; }

        internal HistoricalPerformance(int teamId, string name, string oppName, int wins, int losses, double winPercentage, double averagePoints, double averagePointsOpp)
        {
            TeamId = teamId;
            TeamName = name;
            OppName = oppName;
            Wins = wins;
            Losses = losses;
            WinPercentage = Math.Round(winPercentage, 2);
            AveragePoints = Math.Round(averagePoints, 2);
            AveragePointsOpp = Math.Round(averagePointsOpp, 2);
        }
    }
}
