using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class Conference
    {
        public int ConferenceId { get; }
        public string Name { get; }
        public string Nickname { get; }

        internal Conference(int conferenceId, string name, string nickname)
        {
            ConferenceId = conferenceId;
            Name = name;
            Nickname = nickname;
        }
    }
}
