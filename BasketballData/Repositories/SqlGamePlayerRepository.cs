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
    public class SqlGamePlayerRepository : IGamePlayerRepository
    {
        private readonly string connectionString;

        public SqlGamePlayerRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<GamePlayer> RetrieveGamePlayers(string first, string last)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.RetrieveAllGamePlayersForAPlayer", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("FirstName", first);
                    command.Parameters.AddWithValue("LastName", last);

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateGamePlayers(reader);
                }
            }
        }

        private IReadOnlyList<GamePlayer> TranslateGamePlayers(SqlDataReader reader)
        {
            var gamePlayers = new List<GamePlayer>();

            var dateOrdinal = reader.GetOrdinal("Date");
            var teamNameOrdinal = reader.GetOrdinal("TeamName");
            var oppTeamNameOrdinal = reader.GetOrdinal("OpponentTeamName");
            var minutes = reader.GetOrdinal("Minutes");
            var points = reader.GetOrdinal("Points");
            var assists = reader.GetOrdinal("Assists");
            var rebounds = reader.GetOrdinal("Rebounds");
            var steals = reader.GetOrdinal("Steals");
            var blocks = reader.GetOrdinal("Blocks");
            var turnovers = reader.GetOrdinal("Turnovers");

            while (reader.Read())
            {
                gamePlayers.Add(new GamePlayer(
                   reader.GetDateTime(dateOrdinal),
                   reader.GetString(teamNameOrdinal),
                   reader.GetString(oppTeamNameOrdinal),
                   reader.GetInt32(minutes),
                   reader.GetInt32(points),
                   reader.GetInt32(assists),
                   reader.GetInt32(rebounds),
                   reader.GetInt32(steals),
                   reader.GetInt32(blocks), 
                   reader.GetInt32(turnovers)
                   ));
            }

            return gamePlayers;
        }
    }
}
