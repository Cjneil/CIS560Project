using BasketballData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData
{
    public interface IGameTeamRepository
    {
        IReadOnlyList<GameTeam> RetrieveGameTeams();
    }
}
