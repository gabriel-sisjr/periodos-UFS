using System;
using System.Collections.Generic;

namespace SolucaoTDI1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            try
            {
                Console.Write("Insira o valor pra x: ");
                var x = int.Parse(Console.ReadLine());
                Console.WriteLine(x.GetType());



                var l = new List<Terriaga>
                {
                    new Terriaga
                    {
                        Idade = 20,
                        Nome = "Terriaga"
                    },
                    new Terriaga
                    {
                        Idade = 22,
                        Nome = "Joao"
                    }
                };


                Console.WriteLine(l.Find(t => t.Nome == "Terriaga"));
            }
            catch (Exception e)
            {
                Console.WriteLine("Valor deve ser inteiro!!");
                Console.Write(e.Message);
            }

        }
    }
}
