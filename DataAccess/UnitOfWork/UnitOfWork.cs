using DataAccess.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.UnitOfWork
{
    class UnitOfWork : IUnitOfWork
    {
        private readonly CarServiceContext _context;
        // to do repositories 

        public UnitOfWork(CarServiceContext context)
        {
            _context = context;
        }

        public void Commit()
        {
            _context.SaveChanges();
        }
    }
}
