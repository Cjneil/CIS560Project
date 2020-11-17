using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{

   public class Team
   {
      public int TeamId { get; }
      public int ConferenceId { get; }
      public string Name { get; }
      public string Mascot { get; }
      public string City { get; }
      public string State { get; }
      
      internal Team(int teamId, int conferenceId,
         string name, string mascot, string city, string state)
      {
         TeamId = teamId;
         ConferenceId = conferenceId;
         Name = name;
         Mascot = mascot;
         City = city;
         State = state;
      }
   }
}
