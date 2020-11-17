using System.Collections.Generic;
using BasketballData.Models;

namespace BasketballData
{
   public interface ITeamRepository
   {
      IReadOnlyList<Team> RetrieveTeams();
      Team GetTeam(string name);
      Team CreateTeam(int conferenceId, string name, string mascot, string city, string state);
   }
}
