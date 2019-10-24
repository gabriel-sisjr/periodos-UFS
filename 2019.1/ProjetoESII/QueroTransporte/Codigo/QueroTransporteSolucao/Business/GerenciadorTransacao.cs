﻿using Persistence;
using QueroTransporte.Model;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Business
{
    public class GerenciadorTransacao : IGerenciador<TransacaoModel>
    {

        private readonly BD_QUERO_TRANSPORTEContext _context;
        public GerenciadorTransacao(BD_QUERO_TRANSPORTEContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Obtem uma determinada transacao de um usuario
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public TransacaoModel ObterPorId(int id)
        => _context.Transacao
                .Where(tm => tm.Id == id)
                .Select(transacao => new TransacaoModel
                {
                    Id = transacao.Id,
                    IdUsuario = transacao.IdUsuario,
                    QtdCreditos = transacao.QtdCreditos,
                    Valor = transacao.Valor,
                    Deferido = Convert.ToBoolean(transacao.Deferido),
                    Status = transacao.Status,
                    Data = transacao.Data,
                    Tipo = transacao.Tipo
                }).FirstOrDefault();


        /// <summary>
        /// Obtem todas as transacoes de um usuario
        /// </summary>
        /// <returns></returns>
        public List<TransacaoModel> ObterTodos(int idUsuario)
            => _context.Transacao
                .Where(tm => tm.IdUsuario == idUsuario)
                .OrderByDescending(tm => tm.Data)
                .Select(transacao => new TransacaoModel
                {
                    Id = transacao.Id,
                    IdUsuario = transacao.IdUsuario,
                    QtdCreditos = transacao.QtdCreditos,
                    Valor = transacao.Valor,
                    Deferido = Convert.ToBoolean(transacao.Deferido),
                    Status = transacao.Status,
                    Data = transacao.Data,
                    Tipo = transacao.Tipo
                }).ToList();

        /// <summary>
        /// Obtem Todas as transações deferidas/Não deferidas do sistema.
        /// </summary>
        /// <param name="deferido"></param>
        /// <returns></returns>
        public List<TransacaoModel> ObterTodasDeferidas(bool deferido)
            => _context.Transacao
                .Where(tm => tm.Deferido == Convert.ToByte(deferido))
                .Select(transacao => new TransacaoModel
                {
                    Id = transacao.Id,
                    IdUsuario = transacao.IdUsuario,
                    QtdCreditos = transacao.QtdCreditos,
                    Valor = transacao.Valor,
                    Deferido = Convert.ToBoolean(transacao.Deferido),
                    Status = transacao.Status,
                    Data = transacao.Data,
                    Tipo = transacao.Tipo
                }).ToList();

        /// <summary>
        /// Insere uma nova transacao na base de dados
        /// </summary>
        /// <param name="objeto"></param>
        /// <returns></returns>
        public bool Inserir(TransacaoModel objeto)
        {
            Transacao _transacao = new Transacao();

            Atribuir(_transacao, objeto);
            _context.Add(_transacao);
            return _context.SaveChanges() == 1 ? true : false;
        }

        /// <summary>
        /// Atribui dados do model para o objeto a ser inserido no banco 
        /// </summary>
        /// <param name="credito"></param>
        /// <param name="objeto"></param>
        private void Atribuir(Transacao transacao, TransacaoModel objeto)
        {
            transacao.IdUsuario = objeto.IdUsuario;
            transacao.QtdCreditos = objeto.QtdCreditos;
            transacao.Valor = objeto.Valor;
            transacao.Status = objeto.Status;
            transacao.Deferido = Convert.ToByte(objeto.Deferido);
            transacao.Data = objeto.Data;
            transacao.Tipo = objeto.Tipo;
        }

        /// <summary>
        /// Atualiza os dados de uma transacao da base de dados
        /// </summary>
        /// <param name="objeto"></param>
        /// <returns></returns>
        public bool Editar(TransacaoModel objeto)
        {
            Transacao _transacao = new Transacao();
            Atribuir(_transacao, objeto);
            _context.Update(_transacao);
            return _context.SaveChanges() == 1 ? true : false;
        }

        public bool Remover(int id)
        {
            throw new NotImplementedException();
        }

        public List<TransacaoModel> ObterTodos()
        {
            throw new NotImplementedException();
        }
    }
}
