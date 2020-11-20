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
    public class PlayerAveragesModel : PageModel
    {
        /// <summary>
        /// Terms to show items that include
        /// </summary>
        [BindProperty(SupportsGet = true)]
        public string SearchTerms { get; set; }

        public SqlPlayerRepository playerRepository = new SqlPlayerRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public SqlConferenceRepository conferenceRepository = new SqlConferenceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public IEnumerable<Conference> Conferences { get; set; }
        public IEnumerable<Player> Players { get; set; }

        public void OnGet()
        {
            Players = playerRepository.GetPlayerStats();
            if (SearchTerms != null)
            {
                string[] splitTerms = SearchTerms.Split(" ");
                
                //this is here because for some reason the Data project does not seem to recognize the Contains(2 inputs) overload despite necessary dependencies
                Players = Players.Where(player => splitTerms.Any(term => player.FirstName.Contains(term, StringComparison.InvariantCultureIgnoreCase)) || splitTerms.Any(term => player.LastName.Contains(term, StringComparison.InvariantCultureIgnoreCase)));
            }
        }
    }
}
