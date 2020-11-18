using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonData
{
    public class SqlReportsRepository : IReportsRepository
    {
        private readonly string connectionString;

        public SqlReportsRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }


    }
}
