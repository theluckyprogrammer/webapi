namespace DVDRental.Repository
{
    using DatabaseClient;
    using DatabaseClient.TableEntity;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Linq;
    using DatabaseClient.Exentsions;
    using System.Collections.Generic;

    public class DVDRentalContext : DbContext
    {       
        public virtual DbSet<Actor> Actors { get; set; }
        public virtual DbSet<Film> Films { get; set; }
        public virtual DbSet<Category> Categorys { get; set; }       
       

        public DVDRentalContext()
            : base("name=DVDRentalMSSqlServer")
        {
           
            Database.SetInitializer<DVDRentalContext>(null);
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.HasDefaultSchema("public");
            base.OnModelCreating(modelBuilder);
        }

        public virtual ITransaction BeginTransaction()
        {
            return Database.BeginTransaction().ToITransaction();
        }

        public virtual int ExecuteSqlCommand(bool ensureTransaction, string query, params string[] parameters)
        {
            return Database.ExecuteSqlCommand(
                ensureTransaction ? System.Data.Entity.TransactionalBehavior.EnsureTransaction :
                System.Data.Entity.TransactionalBehavior.DoNotEnsureTransaction,
                query, parameters);
        }

        public virtual IEnumerable<T> FillEntity<T>(string sqlQuery)
        {
            return Database.SqlQuery<T>(sqlQuery).ToList();
        }
    }

  
}