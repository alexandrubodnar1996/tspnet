using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace DataAccess.Context
{
    class CarServiceContext : DbContext, ICarServiceContext, IDesignTimeDbContextFactory<CarServiceContext>
    {

        public CarServiceContext() { }

        public CarServiceContext(DbContextOptions<CarServiceContext> options) :base(options)
        {
            Database.EnsureCreated();
        }


        public CarServiceContext CreateDbContext(string[] args)
        {
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .Build();

            var builder = new DbContextOptionsBuilder<CarServiceContext>();
            var connectionString = configuration.GetConnectionString("DefaultConnection");
            builder.UseSqlServer(connectionString);

            return new CarServiceContext(builder.Options);
        }

        protected override void OnModelCreating(ModelBuilder model)
        {
            base.OnModelCreating(model);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=car_service;Trusted_Connection=True;");
            }
        }

        public void Save()
        {
            this.SaveChanges();
        }
    }
}
