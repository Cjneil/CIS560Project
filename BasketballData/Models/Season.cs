using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class Season
    {
        public int SeasonId { get; }
        public string YearRange { get; }

        internal Season(int seasonId, string yearRange)
        {
            SeasonId = seasonId;
            YearRange = yearRange;
        }
    }
}
