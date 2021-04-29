using GreenFlux.SmartCharging.Domain.Entities;
using GreenFlux.SmartCharging.Domain.Repositories;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace GreenFlux.SmartCharging.Infrastructure.Repositories
{
    public class ConnectorRepository : IConnectorRepository
    {
        private readonly IConfiguration _configuration;

        public ConnectorRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void CreateConnector(Connector connector)
        {
            var query = $@"INSERT INTO gf_smartcharging.connectors
                               (MaxCurrent, ChargeStationId)
                           VALUES
                               (@MaxCurrent, @ChargeStationId);
                           SELECT LAST_INSERT_ID()";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaxCurrent", connector.MaxCurrent);
                    command.Parameters.AddWithValue("@ChargeStationId", connector.ChargeStationId);

                    connector.Id = Convert.ToInt64(command.ExecuteScalar());
                }
            }
        }

        public void UpdateConnector(Connector connector)
        {
            var query = $@"UPDATE gf_smartcharging.connectors
                           SET MaxCurrent = @MaxCurrent
                           WHERE Id = @Id;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", connector.Id);
                    command.Parameters.AddWithValue("@MaxCurrent", connector.MaxCurrent);

                    command.ExecuteNonQuery();
                }
            }
        }

        public Connector GetConnectorById(long id)
        {
            var query = $@"SELECT * FROM gf_smartcharging.connectors
                           WHERE Id = @Id;";

            var connector = new Connector();

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", id);

                    var reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        connector.Id = Convert.ToInt64(reader["Id"]);
                        connector.MaxCurrent = Convert.ToDecimal(reader["MaxCurrent"]);
                        connector.ChargeStationId = Convert.ToInt64(reader["ChargeStationId"]);
                    }
                }
            }

            return connector;
        }

        public List<Connector> GetConnectorsByChargeStationId(long chargeStationId)
        {
            var query = $@"SELECT * FROM gf_smartcharging.connectors
                           WHERE ChargeStationId = @ChargeStationId;";

            var connectorList = new List<Connector>();

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ChargeStationId", chargeStationId);

                    var reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        var connector = new Connector();

                        connector.Id = Convert.ToInt64(reader["Id"]);
                        connector.MaxCurrent = Convert.ToDecimal(reader["MaxCurrent"]);
                        connector.ChargeStationId = Convert.ToInt64(reader["ChargeStationId"]);

                        connectorList.Add(connector);
                    }
                }
            }

            return connectorList;
        }

        public List<Connector> GetConnectorsByChargeStationIds(List<ChargeStation> chargeStationList)
        {
            var chargeStationIdList = chargeStationList.Select(cs => cs.Id);
            var groupIdQuery = string.Join(",", chargeStationIdList);

            var connectorList = new List<Connector>();

            if (string.IsNullOrEmpty(groupIdQuery))
                return connectorList;

            var query = $@"SELECT * FROM gf_smartcharging.connectors
                           WHERE ChargeStationId IN ({groupIdQuery});";

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
                        var connector = new Connector();

                        connector.Id = Convert.ToInt64(reader["Id"]);
                        connector.MaxCurrent = Convert.ToDecimal(reader["MaxCurrent"]);
                        connector.ChargeStationId = Convert.ToInt64(reader["ChargeStationId"]);

                        connectorList.Add(connector);
                    }
                }
            }

            return connectorList;
        }

        public void DeleteConnector(Connector connector)
        {
            var query = $@"DELETE FROM gf_smartcharging.connectors
                           WHERE Id = @Id;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", connector.Id);

                    command.ExecuteNonQuery();
                }
            }
        }

        public List<Connector> GetAllConnectors()
        {
            var query = $@"SELECT * FROM gf_smartcharging.connectors;";

            var connectorList = new List<Connector>();

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
                        var connector = new Connector();

                        connector.Id = Convert.ToInt64(reader["Id"]);
                        connector.MaxCurrent = Convert.ToDecimal(reader["MaxCurrent"]);
                        connector.ChargeStationId = Convert.ToInt64(reader["ChargeStationId"]);

                        connectorList.Add(connector);
                    }
                }
            }

            return connectorList;
        }
    }
}
