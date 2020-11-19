using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasketballData
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
