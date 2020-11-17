using BasketballData.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonData
{
    public class SqlPlayerRepository : IPlayerRepository
    {
        private readonly string connectionString;

        public SqlPlayerRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<Player> RetrievePlayers()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Person.RetrievePlayers", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslatePlayers(reader);
                }
            }
        }

        private IReadOnlyList<Player> TranslatePlayers(SqlDataReader reader)
        {
            var players = new List<Player>();

            var playerIdOrdinal = reader.GetOrdinal("PlayerId");
            var teamIdOrdinal = reader.GetOrdinal("TeamId");
            var firstName = reader.GetOrdinal("FirstName");
            var lastName = reader.GetOrdinal("LastName");
            var position = reader.GetOrdinal("Position");

            while (reader.Read())
            {
                players.Add(new Player(
                   reader.GetInt32(playerIdOrdinal),
                   reader.GetInt32(teamIdOrdinal),
                   reader.GetString(firstName),
                   reader.GetString(lastName),
                   reader.GetString(position)));
            }

            return players;
        }
    }
}
