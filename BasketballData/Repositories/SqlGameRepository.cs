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
    public class SqlGameRepository : IGameRepository
    {
        private readonly string connectionString;

        public SqlGameRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<Game> RetrieveGames()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Person.RetrieveGames", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateGames(reader);
                }
            }
        }

        private IReadOnlyList<Game> TranslateGames(SqlDataReader reader)
        {
            var games = new List<Game>();

            var gameIdOrdinal = reader.GetOrdinal("GameId");
            var seasonIdOrdinal = reader.GetOrdinal("SeasonId");
            var neutral = reader.GetOrdinal("Neutral");
            var date = reader.GetOrdinal("Date");


            while (reader.Read())
            {
                games.Add(new Game(
                   reader.GetInt32(gameIdOrdinal),
                   reader.GetInt32(seasonIdOrdinal),
                   reader.GetInt32(neutral),
                   reader.GetDateTime(date)
                   ));
            }

            return games;
        }
    }
}
