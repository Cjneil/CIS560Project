using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class GamePlayer
    {
        public int PlayerId { get; }
        public int GameTeamId { get; }
        public int TeamId { get; }
        public int Minutes { get; }
        public int Points { get; }
        public int Assists { get; }
        public int Rebounds { get; }
        public int Steals { get; }
        public int Blocks { get; }
        public int Turnovers { get; }

        internal GamePlayer(int playerId, int gameTeamId, int teamId, int minutes, int points, int assists, int rebounds, int steals, int blocks, int turnovers)
        {
            PlayerId = playerId;
            GameTeamId = gameTeamId;
            TeamId = teamId;
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
