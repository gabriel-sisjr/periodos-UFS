﻿namespace Persistences
{
    public partial class UsuarioOrganizacoes
    {
        public int Id { get; set; }
        public int Organizacao { get; set; }
        public int Usuario { get; set; }

        public Organizacao OrganizacaoNavigation { get; set; }
        public Usuario UsuarioNavigation { get; set; }
    }
}
