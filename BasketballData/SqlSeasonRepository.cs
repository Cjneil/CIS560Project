using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasketballData;
using BasketballData.Models;

namespace PersonData
{
    public class SqlSeasonRepository : ISeasonRepository
    {
        private readonly string connectionString;

        public SqlSeasonRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IReadOnlyList<Season> RetrieveSeasons()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Person.RetrieveSeasons", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateSeasons(reader);
                }
            }
        }

        private IReadOnlyList<Season> TranslateSeasons(SqlDataReader reader)
        {
            var seasons = new List<Season>();

            var seasonIdOrdinal = reader.GetOrdinal("SeasonId");
            var yearRange = reader.GetOrdinal("YearRange");

            while (reader.Read())
            {
                seasons.Add(new Season(
                   reader.GetInt32(seasonIdOrdinal),
                   reader.GetString(yearRange)));
            }

            return seasons;
        }
    }
}
