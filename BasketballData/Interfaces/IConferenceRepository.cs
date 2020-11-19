using System.Collections.Generic;
using BasketballData.Models;

namespace BasketballData
{
   public interface IConferenceRepository
   {
        IReadOnlyList<Conference> RetrieveConferences();
   }
}
