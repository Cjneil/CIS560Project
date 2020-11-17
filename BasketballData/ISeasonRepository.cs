using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasketballData.Models;

namespace PersonData
{
    public interface ISeasonRepository
    {
        IReadOnlyList<Season> RetrieveSeasons();
    }
}
