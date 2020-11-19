using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasketballData.Models;

namespace BasketballData.Interfaces
{
    public interface IConferenceStatisticsRepository
    {
        IReadOnlyList<PlayerRecord> RetrieveConferencesStatistics();
    }
}
