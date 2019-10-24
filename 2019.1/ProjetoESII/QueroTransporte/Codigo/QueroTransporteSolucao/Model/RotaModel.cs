
using System;
using System.ComponentModel.DataAnnotations;

namespace QueroTransporte.Model
{
    public class RotaModel
    {
        [Required]
        [Key]
        public int Id { get; set; }
        [Required]
        [MaxLength(30)]
        public string Origem { get; set; }
        [Required]
        [MaxLength(30)]
        public string Destino { get; set; }
        [Required(ErrorMessage = "O Horario de saida � obrigatorio")]
        [Display(Name = "Horario partida")]
        [DataType(DataType.Time)]
        [DisplayFormat(DataFormatString = "{0:T}", ApplyFormatInEditMode = true)]
        public TimeSpan HorarioSaida { get; set; }
        [Required(ErrorMessage = "O Horario de chegada � obrigatorio")]
        [Display(Name = "Horario chegada")]
        [DataType(DataType.Time)]
        [DisplayFormat(DataFormatString = "{0:T}", ApplyFormatInEditMode = true)]
        public TimeSpan HorarioChegada { get; set; }
        [Required]
        [MaxLength(30)]
        [Display(Name = "Dia da Semana")]
        public string DiaSemana { get; set; }
        [Display(Name = "Rota M�e")]
        public int? RotaId { get; set; }
        [Required]
        [Display(Name = "Rota Composta")]
        public bool IsComposta { get; set; }


        /* serve para concatenar informacoes como Origem,Destino e Id da para
         usu�rio selecionar a rota correta*/
        public string DetalhesRota { get; set; }
    }
}