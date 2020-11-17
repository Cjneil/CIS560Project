using BasketballData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonData
{
    public interface IPlayerRepository
    {
        IReadOnlyList<Player> RetrievePlayers();
    }
}
