using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Transactions;
using BasketballData;
using BasketballData.Models;

namespace PersonData
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
            using (var command = new SqlCommand("Person.RetrieveTeamsForConference", connection))
            {
               command.CommandType = CommandType.StoredProcedure;

               connection.Open();

               using (var reader = command.ExecuteReader())
                  return TranslateConferences(reader);
            }
         }
      }

        public IReadOnlyList<Conference> RetrieveConferenceStandings(string nickname, string yearRange)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.RetrieveConferenceStandings", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateConferences(reader);
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
   }
}
