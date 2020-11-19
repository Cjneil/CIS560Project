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

        public IReadOnlyList<GameTeam> RetrieveGameTeams()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.RetrieveGameTeams", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateGameTeams(reader);
                }
            }
        }

        private IReadOnlyList<GameTeam> TranslateGameTeams(SqlDataReader reader)
        {
            var gameTeams = new List<GameTeam>();

            var gameTeamIdOrdinal = reader.GetOrdinal("GameTeamId");
            var gameIdOrdinal = reader.GetOrdinal("GameId");
            var teamIdOrdinal = reader.GetOrdinal("TeamId");
            var teamTypeId = reader.GetOrdinal("TeamTypeId");
            var teamScore = reader.GetOrdinal("TeamScore");

            while (reader.Read())
            {
                gameTeams.Add(new GameTeam(
                   reader.GetInt32(gameTeamIdOrdinal),
                   reader.GetInt32(gameIdOrdinal),
                   reader.GetInt32(teamIdOrdinal),
                   reader.GetInt32(teamTypeId),
                   reader.GetInt32(teamScore)
                   ));
            }

            return gameTeams;
        }
    }
}
