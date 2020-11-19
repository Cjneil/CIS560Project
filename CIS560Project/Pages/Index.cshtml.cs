using System;
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


        public SqlConferenceRepository conferenceRepository = new SqlConferenceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public IEnumerable<Conference> Conferences { get; set; }

        public SqlTeamRepository teamRepository = new SqlTeamRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public SqlHistoricalPerformanceRepository matchupRepository = new SqlHistoricalPerformanceRepository(@"Server=(localdb)\MSSQLLocalDb;Database=560Project;Integrated Security=SSPI;");

        public HistoricalPerformance performance { get; set; }
        public IEnumerable<Team> Teams { get; set; }


        public void OnGet()
        {
            Conferences = conferenceRepository.RetrieveConferences();
            Teams = teamRepository.RetrieveTeams();
        }
    }
}
