using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class PlayerRecord
    {
        public string TeamName { get; }

        public string FirstName { get; }
        public string LastName { get; }
        public int Statistic { get; }

        internal PlayerRecord(string team, string first, string last, int statistic)
        {
            TeamName = team;
            FirstName = first;
            LastName = last;
            Statistic = statistic;
        }
    }
}
