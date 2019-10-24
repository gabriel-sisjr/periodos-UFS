﻿using Models;
using Persistences;
using System.Collections.Generic;
using System.Linq;

namespace Business
{
    public class TipoHardwareService : IService<TipoHardwareModel>
    {
        private readonly ContextDb _context;
        public TipoHardwareService(ContextDb context)
        {
            _context = context;
        }

        public List<TipoHardwareModel> GetAll() => _context.Tipohardware.Select(th => new TipoHardwareModel { Id = th.Id, Descricao = th.Descricao }).ToList();

        public TipoHardwareModel GetById(int id) => _context.Tipohardware.Where(th => th.Id == id).Select(th => new TipoHardwareModel { Id = th.Id, Descricao = th.Descricao }).FirstOrDefault();

        public bool Insert(TipoHardwareModel entity)
        {
            _context.Add(SetEntity(entity, new Tipohardware()));
            return _context.SaveChanges() == 1 ? true : false;
        }

        public bool Remove(int id)
        {
            var x = _context.Tipohardware.Where(th => th.Id == id).FirstOrDefault();
            if (x != null)
            {
                _context.Remove(x);
                return _context.SaveChanges() == 1 ? true : false;
            }

            return false;
        }

        public bool Update(TipoHardwareModel entity)
        {
            var x = _context.Tipohardware.Where(th => th.Id == entity.Id).FirstOrDefault();
            if (x != null)
            {
                _context.Update(SetEntity(entity, x));
                return _context.SaveChanges() == 1 ? true : false;
            }

            return false;
        }

        private static Tipohardware SetEntity(TipoHardwareModel model, Tipohardware entity)
        {
            entity.Id = model.Id;
            entity.Descricao = model.Descricao;

            return entity;
        }
    }
}
