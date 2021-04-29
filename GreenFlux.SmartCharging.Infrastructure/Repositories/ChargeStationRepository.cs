using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Repositories;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace GreenFlux.SmartCharging.Infrastructure.Repositories
{
    public class ChargeStationRepository : IChargeStationRepository
    {
        private readonly IConfiguration _configuration;

        public ChargeStationRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public List<ChargeStation> GetAllChargeStations()
        {
            var query = $@"SELECT * FROM gf_smartcharging.`charge-stations`;";

            var chargeStationList = new List<ChargeStation>();

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var chargeStation = new ChargeStation();

                        chargeStation.Id = Convert.ToInt64(reader["Id"]);
                        chargeStation.Name = (string)reader["Name"];
                        chargeStation.GroupId = Convert.ToInt64(reader["GroupId"]);

                        chargeStationList.Add(chargeStation);
                    }
                }
            }

            return chargeStationList;
        }

        public void CreateChargeStation(ChargeStation chargeStation)
        {
            var query = @$"INSERT INTO gf_smartcharging.`charge-stations`
                               (Name, GroupId)
                           VALUES
                               (@Name, @GroupId);
                           SELECT LAST_INSERT_ID()";

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", chargeStation.Name);
                    command.Parameters.AddWithValue("@GroupId", chargeStation.GroupId);

                    chargeStation.Id = Convert.ToInt64(command.ExecuteScalar());
                }
            }
        }

        public ChargeStation GetChargeStationById(long chargeStationId)
        {
            var query = $@"SELECT * FROM gf_smartcharging.`charge-stations`
                           WHERE Id = @Id;";

            var chargeStation = new ChargeStation();

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", chargeStationId);

                    var reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        chargeStation.Id = Convert.ToInt64(reader["Id"]);
                        chargeStation.Name = (string)reader["Name"];
                        chargeStation.GroupId = Convert.ToInt64(reader["GroupId"]);
                    }
                }
            }

            return chargeStation;
        }

        public List<ChargeStation> GetChargeStationListByGroupId(long groupId)
        {
            var query = $@"SELECT * FROM gf_smartcharging.`charge-stations`
                           WHERE GroupId = @GroupId;";

            var chargeStationList = new List<ChargeStation>();

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@GroupId", groupId);

                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        var chargeStation = new ChargeStation();

                        chargeStation.Id = Convert.ToInt64(reader["Id"]);
                        chargeStation.Name = (string)reader["Name"];
                        chargeStation.GroupId = Convert.ToInt64(reader["GroupId"]);

                        chargeStationList.Add(chargeStation);
                    }
                }
            }

            return chargeStationList;
        }

        public void DeleteChargeStation(ChargeStation chargeStation)
        {
            var query = $@"DELETE FROM gf_smartcharging.`charge-stations`
                           WHERE Id = @Id;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", chargeStation.Id);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void UpdateChargeStation(ChargeStation chargeStation)
        {
            var query = $@"UPDATE gf_smartcharging.`charge-stations`
                           SET Name = @Name;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", chargeStation.Name);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
