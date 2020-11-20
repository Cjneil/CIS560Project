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
    public class TeamGameHistoryModel : PageModel
    {
        public IEnumerable<GameTeam> Games { get; set; }

        public SqlGameTeamRepository gamePlayerRepository = new SqlGameTeamRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        [BindProperty(SupportsGet = true)]
        public string Team { get; set; }

        public void OnGet()
        {
            if(Team != null)
            {
                Games = gamePlayerRepository.RetrieveGameTeams(Team);
            }
        }
    }
}
