using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class GameTeam
    {
        public int GameTeamId { get; }
        public int GameId { get; }
        public int TeamId { get; }
        public int TeamTypeId { get; }
        public int TeamScore { get; }

        internal GameTeam(int gameTeamId, int gameId, int teamId, int teamTypeId, int teamScore)
        {
            GameTeamId = gameTeamId;
            GameId = gameId;
            TeamId = teamId;
            TeamTypeId = teamTypeId;
            TeamScore = teamScore;
        }
    }
}
