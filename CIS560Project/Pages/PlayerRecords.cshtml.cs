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
    public class PlayerRecordsModel : PageModel
    {

        public SqlPlayerRepository playerRepository = new SqlPlayerRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public SqlConferenceRepository conferenceRepository = new SqlConferenceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public IEnumerable<Conference> Conferences { get; set; }
        public IEnumerable<PlayerRecord> PlayerRecords { get; set; }
        public IEnumerable<Player> Players { get; set; }

        [BindProperty(SupportsGet =true)]
        public string Statistic { get; set; }

        [BindProperty(SupportsGet = true)]
        public int PlayerCount { get; set; }

        [BindProperty(SupportsGet = true)]
        public string ConferenceNickname { get; set; }

        public void OnGet()
        {
            Conferences = conferenceRepository.RetrieveConferences();
            Players = playerRepository.RetrievePlayers();
            if(ConferenceNickname != null && Statistic != null)
            {
                PlayerRecords = playerRepository.GetPlayerRecords(ConferenceNickname, Statistic, PlayerCount);
            }
        }
    }
}
