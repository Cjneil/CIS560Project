using System.Collections.Generic;
using DataAccess;
using PersonData.Models;
using PersonData.DataDelegates;
using System;

namespace PersonData
{
   public class SqlPersonRepository : IPersonRepository
   {
      private readonly SqlCommandExecutor executor;

      public SqlPersonRepository(string connectionString)
      {
         executor = new SqlCommandExecutor(connectionString);
      }

      public Person CreatePerson(string firstName, string lastName)
      {
         if (string.IsNullOrWhiteSpace(firstName))
            throw new ArgumentException("The parameter cannot be null or empty.", nameof(firstName));

         if (string.IsNullOrWhiteSpace(lastName))
            throw new ArgumentException("The parameter cannot be null or empty.", nameof(lastName));

         var d = new CreatePersonDataDelegate(firstName, lastName);
         return executor.ExecuteNonQuery(d);
      }

      public Person GetPerson(int personId)
      {
         var d = new GetPersonDataDelegate(personId);
         return executor.ExecuteReader(d);
      }

      public IReadOnlyList<Person> RetrievePersons()
      {
         return executor.ExecuteReader(new RetrievePersonsDataDelegate());
      }
   }
}
