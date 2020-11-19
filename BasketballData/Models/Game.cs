using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class Game
    {
        public int GameId { get; }
        public int SeasonId { get; }
        public string SeasonYears { get; }
        public int Neutral { get; }
        public DateTime Date {get;} 

        internal Game(int gameId, int seasonId, int neutral, DateTime date)
        {
            GameId = gameId;
            SeasonId = seasonId;
            Neutral = neutral;
            Date = date;
        }
    }
}
