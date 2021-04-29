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
    public class GroupRepository : IGroupRepository
    {
        private readonly IConfiguration _configuration;

        public GroupRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void CreateGroup(Group group)
        {
            var query = @$"INSERT INTO gf_smartcharging.groups
                               (Name, CurrentCapacity)
                           VALUES
                                (@Name, @CurrentCapacity);
                           SELECT LAST_INSERT_ID()";

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", group.Name);
                    command.Parameters.AddWithValue("@CurrentCapacity", group.CurrentCapacity);

                    group.Id = Convert.ToInt64(command.ExecuteScalar());
                }
            }
        }

        public void DeleteGroup(Group group)
        {
            var query = $@"DELETE FROM gf_smartcharging.groups
                           WHERE Id = @Id;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", group.Id);

                    command.ExecuteNonQuery();
                }
            }
        }

        public Group GetGroupById(long groupId)
        {
            var query = $@"SELECT * FROM gf_smartcharging.groups
                           WHERE Id = @Id;";

            var group = new Group();

            // On real applications the DB password would be stored somewhere else (KMS, SecretManager or similar services)
            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", groupId);

                    var reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        group.Id = Convert.ToInt64(reader["Id"]);
                        group.Name = (string)reader["Name"];
                        group.CurrentCapacity = Convert.ToDecimal(reader["CurrentCapacity"]);
                    }
                }
            }

            return group;
        }

        public void UpdateGroup(Group group)
        {
            var query = $@"UPDATE gf_smartcharging.groups
                           SET Name = @Name,
                               CurrentCapacity = @CurrentCapacity;";

            var connectionString = _configuration["DatabaseConnection:ConnectionString"];
            using (var connection = new MySqlConnection(connectionString))
            {
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", group.Name);
                    command.Parameters.AddWithValue("@CurrentCapacity", group.CurrentCapacity);

                    command.ExecuteNonQuery();
                }
            }
        }

        public List<Group> GetAllGroups()
        {
            var query = $@"SELECT * FROM gf_smartcharging.groups;";

            var groupList = new List<Group>();

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
                        var group = new Group();

                        group.Id = Convert.ToInt64(reader["Id"]);
                        group.Name = (string)reader["Name"];
                        group.CurrentCapacity = Convert.ToDecimal(reader["CurrentCapacity"]);

                        groupList.Add(group);
                    }
                } 
            }

            return groupList;
        }
    }
}
