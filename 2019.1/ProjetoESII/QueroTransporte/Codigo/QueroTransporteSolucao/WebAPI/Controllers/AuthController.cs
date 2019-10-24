﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Model.ViewModel;
using QueroTransporte.Negocio;
using QueroTransporteWeb.Resources.Methods;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly GerenciadorUsuario _service;
        public AuthController(IConfiguration configuration, GerenciadorUsuario service)
        {
            _configuration = configuration;
            _service = service;
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult RequestToken([FromBody] LoginViewModel request)
        {
            var user = _service.ObterPorLoginSenha(MethodsUtils.RemoverCaracteresEspeciais(request.Cpf), Criptografia.GerarHashSenha(request.Senha));
            if (user != null)
            {
                var claims = new[]
                {
                    new Claim(ClaimTypes.SerialNumber, user.Id.ToString()),
                    new Claim(ClaimTypes.NameIdentifier, user.Nome),
                    new Claim(ClaimTypes.UserData, user.Cpf),
                    new Claim(ClaimTypes.Email, user.Email),
                    new Claim(ClaimTypes.OtherPhone, user.Telefone),
                    new Claim(ClaimTypes.Role, user.Tipo)
                };


                // Recebe uma instancia da classe SymmetricSecurityKey e armazena a key de segurança settada no appsettings.
                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["SecurityKey"]));

                // Recebe uma instancia de SigningCredentials contendo a chave de critpgrafia e o algoritmo q fará a encr/descriptogafia
                var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);


                // Criando o token efetivamente
                var token = new JwtSecurityToken(
                    issuer: "QueroTransporte", // Emissor
                    audience: "QueroTransporte",
                    claims: claims,
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: credentials
                );

                return Ok(new
                {
                    token = new JwtSecurityTokenHandler().WriteToken(token)
                });
            }

            return BadRequest("Credenciais Invalidas");
        }
    }
}
