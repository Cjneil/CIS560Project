using System.Collections.Generic;
using BasketballData.Models;

namespace BasketballData
{
   public interface ITeamRepository
   {
        IReadOnlyList<Team> RetrieveTeams();
        IReadOnlyList<Team> RetrieveTeamsByConference(string nickname);
        Team GetTeam(string name);
   }
}
