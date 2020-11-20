using BasketballData.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData
{
    public class SqlGameTeamRepository : IGameTeamRepository
    {
        private readonly string connectionString;

        public SqlGameTeamRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<GameTeam> RetrieveGameTeams(string team)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.RetrieveAllGameTeamsForATeam", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("TeamName", team);
                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateGameTeams(reader);
                }
            }
        }

        private IReadOnlyList<GameTeam> TranslateGameTeams(SqlDataReader reader)
        {
            var gameTeams = new List<GameTeam>();

            var dateOrdinal = reader.GetOrdinal("Date");
            var teamNameOrdinal = reader.GetOrdinal("Name");
            var teamScoreOrdinal = reader.GetOrdinal("TeamScore");
            var oppNameOrdinal = reader.GetOrdinal("OpponentName");
            var oppScoreOrdinal = reader.GetOrdinal("OpponentScore");
            var teamTypeOrdinal = reader.GetOrdinal("TeamTypeId");

            while (reader.Read())
            {
                gameTeams.Add(new GameTeam(
                   reader.GetDateTime(dateOrdinal),
                   reader.GetInt32(teamScoreOrdinal),
                   reader.GetString(teamNameOrdinal),
                   reader.GetInt32(oppScoreOrdinal),
                   reader.GetString(oppNameOrdinal),
                   reader.GetInt32(teamTypeOrdinal)
                   ));
            }

            return gameTeams;
        }
    }
}
