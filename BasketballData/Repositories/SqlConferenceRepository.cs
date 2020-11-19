using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using BasketballData.Models;

namespace BasketballData
{
   public class SqlConferenceRepository : IConferenceRepository
   {
      private readonly string connectionString;

      public SqlConferenceRepository(string connectionString)
      {
         this.connectionString = connectionString;
      }

      public IReadOnlyList<Conference> RetrieveConferences()
      {
         using (var connection = new SqlConnection(connectionString))
         {
            using (var command = new SqlCommand("Basketball.RetrieveConferences", connection))
            {
               command.CommandType = CommandType.StoredProcedure;

               connection.Open();

               using (var reader = command.ExecuteReader())
                  return TranslateConferences(reader);
            }
         }
      }

        public IReadOnlyList<ConferenceStanding> GetConferenceStandings(string nickname, string yearRange)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.GetConferenceStandings", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("ConferenceNickname", nickname);
                    command.Parameters.AddWithValue("YearRange", yearRange);
                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateConferenceStandings(reader);
                }
            }
        }

        private IReadOnlyList<Conference> TranslateConferences(SqlDataReader reader)
        {
         var conferences = new List<Conference>();

         var conferenceIdOrdinal = reader.GetOrdinal("ConferenceId");
         var nameOrdinal = reader.GetOrdinal("Name");
         var nicknameOrdinal = reader.GetOrdinal("Nickname");

         while (reader.Read())
         {
                conferences.Add(new Conference(
                   reader.GetInt32(conferenceIdOrdinal),
                   reader.GetString(nameOrdinal),
                   reader.GetString(nicknameOrdinal)));
         }

         return conferences;
        }
        private IReadOnlyList<ConferenceStanding> TranslateConferenceStandings(SqlDataReader reader)
        {
            var conferences = new List<ConferenceStanding>();

            var teamNameOrdinal = reader.GetOrdinal("TeamName");
            var winsOrdinal = reader.GetOrdinal("Wins");
            var lossesOrdinal = reader.GetOrdinal("Losses");
            var percentOrdinal = reader.GetOrdinal("WinPercentage");

            while (reader.Read())
            {
                conferences.Add(new ConferenceStanding(
                   reader.GetString(teamNameOrdinal),
                   reader.GetInt32(winsOrdinal),
                   reader.GetInt32(lossesOrdinal),
                   reader.GetDouble(percentOrdinal)));
            }

            return conferences;
        }
    }
}
