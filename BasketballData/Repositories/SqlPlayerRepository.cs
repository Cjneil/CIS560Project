﻿using BasketballData.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData
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
                using (var command = new SqlCommand("Basketball.RetrievePlayers", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslatePlayers(reader);
                }
            }
        }

        public IReadOnlyList<Player> GetPlayerStats()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.GetPlayerStats", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslatePlayersStats(reader);
                }
            }
        }
        public IReadOnlyList<Player> GetPlayerStatsInRange(string first, string last, DateTime start, DateTime end)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.GetPlayerStatsInRange", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("FirstName", first);
                    command.Parameters.AddWithValue("LastName", last);
                    command.Parameters.AddWithValue("DateStart", start.Date);
                    command.Parameters.AddWithValue("DateEnd", end.Date);

                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslatePlayersStats(reader);
                }
            }
        }

        public IReadOnlyList<PlayerRecord> GetPlayerRecords(string nickname, string statistic, int amount)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                using (var command = new SqlCommand("Basketball.ShowPlayerRecordsLeaderboard", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("ConferenceNickname", nickname);
                    command.Parameters.AddWithValue("StatisticChosen", statistic);
                    command.Parameters.AddWithValue("TopN", amount);
                    connection.Open();

                    using (var reader = command.ExecuteReader())
                        return TranslatePlayerRecords(reader);
                }
            }
        }


        private IReadOnlyList<Player> TranslatePlayers(SqlDataReader reader)
        {
            var players = new List<Player>();

            var playerIdOrdinal = reader.GetOrdinal("PlayerId");
            var teamNameOrdinal = reader.GetOrdinal("Name");
            var firstName = reader.GetOrdinal("FirstName");
            var lastName = reader.GetOrdinal("LastName");
            var position = reader.GetOrdinal("Position");

            while (reader.Read())
            {
                players.Add(new Player(
                   reader.GetInt32(playerIdOrdinal),
                   reader.GetString(teamNameOrdinal),
                   reader.GetString(firstName),
                   reader.GetString(lastName),
                   reader.GetString(position)));
            }

            return players;
        }

        private IReadOnlyList<Player> TranslatePlayersStats(SqlDataReader reader)
        {
            var players = new List<Player>();

            var teamNameOrdinal = reader.GetOrdinal("TeamName");
            var firstName = reader.GetOrdinal("FirstName");
            var lastName = reader.GetOrdinal("LastName");
            var position = reader.GetOrdinal("Position");
            var mpg = reader.GetOrdinal("MinutesPerGame");
            var ppg = reader.GetOrdinal("PointsPerGame");
            var apg = reader.GetOrdinal("AssistsPerGame");
            var rbg = reader.GetOrdinal("ReboundsPerGame");
            var spg = reader.GetOrdinal("StealsPerGame");
            var bpg = reader.GetOrdinal("BlocksPerGame");
            var tpg = reader.GetOrdinal("TurnoversPerGame");

            while (reader.Read())
            {
                players.Add(new Player(
                   reader.GetString(teamNameOrdinal),
                   reader.GetString(firstName),
                   reader.GetString(lastName),
                   reader.GetString(position),
                   (double) reader.GetSqlSingle(mpg),
                   (double) reader.GetSqlSingle(ppg),
                   (double) reader.GetSqlSingle(apg),
                   (double) reader.GetSqlSingle(rbg),
                   (double) reader.GetSqlSingle(spg),
                   (double) reader.GetSqlSingle(bpg),
                   (double) reader.GetSqlSingle(tpg)
                   ));
            }

            return players;
        }

        private IReadOnlyList<PlayerRecord> TranslatePlayerRecords(SqlDataReader reader)
        {
            var players = new List<PlayerRecord>();

            var teamNameOrdinal = reader.GetOrdinal("Name");
            var firstName = reader.GetOrdinal("FirstName");
            var lastName = reader.GetOrdinal("LastName");
            var statistic = reader.GetOrdinal("StatisticChosen");

            while (reader.Read())
            {
                players.Add(new PlayerRecord(
                   reader.GetString(teamNameOrdinal),
                   reader.GetString(firstName),
                   reader.GetString(lastName),
                   reader.GetInt32(statistic)));
            }

            return players;
        }
    }
}
