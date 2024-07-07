using Serilog.Sinks.MSSqlServer;
using System.Data;

namespace GiroDashboard.API.Configurations.ColumnWrite
{
    public static class UsernameColumnWrite
    {
        public static ColumnOptions GetColumnOptions()
        {
            var columnOptions = new ColumnOptions();


            // Override the default Primary Column of Serilog by custom column name
            columnOptions.Id.ColumnName = "LogId";


            // Adding all the custom columns
            columnOptions.AdditionalColumns = new List<SqlColumn>
     {
         new SqlColumn { DataType = SqlDbType.VarChar, ColumnName = "UserName", DataLength = 250, AllowNull = true},
         new SqlColumn { DataType = SqlDbType.VarChar, ColumnName = "CreatedBy",DataLength = 50, AllowNull = false },
         new SqlColumn { DataType = SqlDbType.DateTime2, ColumnName = "CreatedDate", DataLength = 7, AllowNull = false },
     };
            return columnOptions;

        }
    }
}
