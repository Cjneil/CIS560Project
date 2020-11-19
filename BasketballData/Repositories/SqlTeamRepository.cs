using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Transactions;
using BasketballData.Models;

namespace BasketballData
{
   public class SqlTeamRepository : ITeamRepository
   {
      private readonly string connectionString;

      public SqlTeamRepository(string connectionString)
      {
         this.connectionString = connectionString;
      }
      
        /// <summary>
        /// gets team with the name input
        /// </summary>
        /// <param name="name">Name of team to be found</param>
        /// <returns>Team object or null if not found</returns>
      public Team GetTeam(string name)
      {
         using (var connection = new SqlConnection(connectionString))
         {
            using (var command = new SqlCommand("Basketball.GetTeamByName", connection))
            {
               command.CommandType = CommandType.StoredProcedure;

               command.Parameters.AddWithValue("Name", name);

               connection.Open();

               using (var reader = command.ExecuteReader())
                  return TranslateTeam(reader);
            }
         }
      }

      public IReadOnlyList<Team> RetrieveTeams()
      {
         using (var connection = new SqlConnection(connectionString))
         {
            using (var command = new SqlCommand("Basketball.RetrieveTeams", connection))
            {
               command.CommandType = CommandType.StoredProcedure;

               connection.Open();

               using (var reader = command.ExecuteReader())
                  return TranslateTeams(reader);
            }
         }
      }

      public IReadOnlyList<Team> RetrieveTeamsByConference(string nickname)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.RetrieveTeamsByConference", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslateTeams(reader);
                }
            }
        }

      private Team TranslateTeam(SqlDataReader reader)
      {
               
            var teamIdOrdinal = reader.GetOrdinal("TeamId");
         var conferenceIdOrdinal = reader.GetOrdinal("ConferenceId");
         var nameOrdinal = reader.GetOrdinal("Name");
         var mascotOrdinal = reader.GetOrdinal("Mascot");
         var cityOrdinal = reader.GetOrdinal("City");
         var stateOrdinal = reader.GetOrdinal("State");

         if (!reader.Read())
            return null;

         return new Team(
            reader.GetInt32(teamIdOrdinal),
            reader.GetInt32(conferenceIdOrdinal),
            reader.GetString(nameOrdinal),
            reader.GetString(mascotOrdinal),
            reader.GetString(cityOrdinal),
            reader.GetString(stateOrdinal)
            );
      }

      private IReadOnlyList<Team> TranslateTeams(SqlDataReader reader)
      {
         var persons = new List<Team>();

          var teamIdOrdinal = reader.GetOrdinal("TeamId");
         var conferenceIdOrdinal = reader.GetOrdinal("ConferenceId");
         var nameOrdinal = reader.GetOrdinal("Name");
         var mascotOrdinal = reader.GetOrdinal("Mascot");
         var cityOrdinal = reader.GetOrdinal("City");
         var stateOrdinal = reader.GetOrdinal("State");

         while (reader.Read())
         {
             persons.Add(
                 new Team(
                    reader.GetInt32(teamIdOrdinal),
                    reader.GetInt32(conferenceIdOrdinal),
                    reader.GetString(nameOrdinal),
                    reader.GetString(mascotOrdinal),
                    reader.GetString(cityOrdinal),
                    reader.GetString(stateOrdinal)
                )
            );
         }

         return persons;
      }
   }
}
