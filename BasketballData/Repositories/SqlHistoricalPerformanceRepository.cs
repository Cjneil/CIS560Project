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
    public class SqlHistoricalPerformanceRepository
    {
        private readonly string connectionString;

        public SqlHistoricalPerformanceRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public HistoricalPerformance GetHistoricalPerformance(string team1, string team2)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.GetHistoricalPerformance", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("TeamName1", team1);
                    command.Parameters.AddWithValue("TeamName2", team2);
                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateHistoricalPerformance(reader);
                }
            }
        }

        private HistoricalPerformance TranslateHistoricalPerformance(SqlDataReader reader)
        {

            var teamIdOrdinal = reader.GetOrdinal("teamId");
            var nameOrdinal = reader.GetOrdinal("Name");
            var winsOrdinal = reader.GetOrdinal("Wins");
            var lossesOrdinal = reader.GetOrdinal("Losses");
            var percentOrdinal = reader.GetOrdinal("WinPercentage");
            var averageOrdinal = reader.GetOrdinal("AveragePoints");

            if (!reader.Read())
                return null;

            return new HistoricalPerformance(
               reader.GetInt32(teamIdOrdinal),
               reader.GetString(nameOrdinal),
               reader.GetInt32(winsOrdinal),
               reader.GetInt32(lossesOrdinal),
               (double) reader.GetSqlSingle(percentOrdinal),
               (double) reader.GetSqlSingle(averageOrdinal)
               );
        }
    }
}
