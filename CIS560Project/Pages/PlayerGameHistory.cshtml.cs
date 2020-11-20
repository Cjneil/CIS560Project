using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using BasketballData;
using BasketballData.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CIS560Project.Pages
{
    public class PlayerGameHistoryModel : PageModel
    {
        public IEnumerable<GamePlayer> Games { get; set; }

        public SqlGamePlayerRepository gamePlayerRepository = new SqlGamePlayerRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        [BindProperty(SupportsGet = true)]
        public string FirstName { get; set; }

        [BindProperty(SupportsGet = true)]
        public string LastName { get; set; }

        public void OnGet()
        {
            if(FirstName != null && LastName != null)
            {
                Games = gamePlayerRepository.RetrieveGamePlayers(FirstName, LastName);
            }
        }
    }
}
