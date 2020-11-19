using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using BasketballData;
using BasketballData.Models;

namespace CIS560Project.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        [BindProperty(SupportsGet = true)]
        public string PlayerFirstName { get; set; }
        [BindProperty(SupportsGet = true)]
        public string PlayerLastName { get; set; }

        [BindProperty(SupportsGet = true)]
        public DateTime StartDate { get; set; }

        [BindProperty(SupportsGet = true)]
        public DateTime EndDate { get; set; }

        [BindProperty(SupportsGet = true)]
        public string Team1Name { get; set; }

        [BindProperty(SupportsGet = true)]
        public string Team2Name { get; set; }

        [BindProperty(SupportsGet = true)]
        public string SeasonChoice { get; set; }

        [BindProperty(SupportsGet = true)]
        public string ConferenceNickname { get; set; }

        public SqlConferenceRepository conferenceRepository = new SqlConferenceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public IEnumerable<Conference> Conferences { get; set; }
        public IEnumerable<ConferenceStanding> ConferenceStandings { get; set; }

        public SqlTeamRepository teamRepository = new SqlTeamRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public SqlHistoricalPerformanceRepository matchupRepository = new SqlHistoricalPerformanceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public SqlPlayerRepository playerRepository = new SqlPlayerRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public SqlSeasonRepository seasonRepository = new SqlSeasonRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");
        public HistoricalPerformance Performance { get; set; }
        public IEnumerable<Team> Teams { get; set; }
        public IEnumerable<Season> Seasons { get; set; }
        public IEnumerable<Player> PlayerStats { get; set; }


        public void OnGet()
        {
            Conferences = conferenceRepository.RetrieveConferences();
            Teams = teamRepository.RetrieveTeams();
            Seasons = seasonRepository.RetrieveSeasons();
            if (PlayerFirstName != null && PlayerLastName != null && StartDate != null && EndDate != null)
                PlayerStats = playerRepository.GetPlayerStatsInRange(PlayerFirstName, PlayerLastName, StartDate, EndDate);
            if (ConferenceNickname != null && SeasonChoice != null)
                ConferenceStandings = conferenceRepository.GetConferenceStandings(ConferenceNickname, SeasonChoice);
            if (Team1Name != null && Team2Name != null)
                Performance = matchupRepository.GetHistoricalPerformance(Team1Name, Team2Name);
        }
    }
}
