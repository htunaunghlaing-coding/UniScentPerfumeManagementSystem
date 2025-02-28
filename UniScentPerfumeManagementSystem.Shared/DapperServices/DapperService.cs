using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace UniScentPerfumeManagementSystem.Shared.DapperServices;

public class DapperService
{
    private readonly string _connectionString;

    public DapperService(string connectionString)
    {
        _connectionString=connectionString;
    }

    public List<M> Query<M>(string query, object? param = null)
    {
        using IDbConnection db = new SqlConnection(_connectionString);
        List<M> list = db.Query<M>(query, param).ToList();
        return list;
    }
}
