using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData.Models
{
    public class Player
    {
        public int PlayerId { get; }
        public int TeamId { get; }
        public string FirstName { get; }
        public string LastName { get; }
        public string Position { get; }

        internal Player(int playerId, int teamId, string firstName, string lastName, string position)
        {
            PlayerId = playerId;
            TeamId = teamId;
            FirstName = firstName;
            LastName = lastName;
            Position = position;
        }
    }
}
