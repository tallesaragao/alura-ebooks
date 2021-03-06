﻿using Casadocodigo.Models;
using FreteCorreiosWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Casadocodigo.Services
{
    public class CorreiosService
    {
        private CalcPrecoPrazoWSSoapClient wsCorreios;
        private readonly string CEP_ORIGEM = "08773495";
        private readonly string PAC = "04510";
        private readonly string SEDEX = "04014";
        private readonly string SEDEX_A_COBRAR = "40045";
        private readonly string SEDEX10 = "40215";
        private readonly string SEDEXHOJE = "40290";

        public CorreiosService()
        {
            wsCorreios = new CalcPrecoPrazoWSSoapClient(CalcPrecoPrazoWSSoapClient.EndpointConfiguration.CalcPrecoPrazoWSSoap);
        }

        public async Task<Frete> CalcularFrete(string cep, IList<ItemPedido> itensPedido)
        {
            //Dados da empresa
            string nCdEmpresa = String.Empty;
            string sDsSenha = String.Empty;

            //Código do tipo de frete
            //41106 - PAC
            //40010 - SEDEX
            //40045 - SEDEX a cobrar
            //40215 - SEDEX 10
            //40290 - SEDEX Hoje

            string nCdServico = PAC;
            string sCepOrigem = "08773495";
            string sCepDestino = cep;

            //Formato
            //1 - Caixa
            int nCdFormato = 1;


            Dimensoes dimensoes = CalcularDimensoesPacote(itensPedido);

            //Para encomenda do tipo PAC, deve-se preencher as dimensões da caixa
            decimal nVlComprimento = dimensoes.Altura < 16 ? 16 : dimensoes.Altura;
            decimal nVlAltura = dimensoes.Profundidade;
            decimal nVlLargura = dimensoes.Largura;
            //Peso em kg
            string nVlPeso = Convert.ToString(dimensoes.Peso / 1000);

            decimal nVlDiametro = decimal.Zero;

            //Informa se é mão própria (S/N)
            string sCdMaoPropria = "N";

            //Valor declarado (opcional)
            decimal nVlValorDeclarado = decimal.Zero;

            //Se deseja receber aviso de recebimento (S/N)
            string sCdAvisoRecebimento = "N";
            cResultado resultado = await wsCorreios.CalcPrecoPrazoAsync(nCdEmpresa, 
                sDsSenha, nCdServico, sCepOrigem, 
                sCepDestino, nVlPeso, nCdFormato, nVlComprimento, 
                nVlAltura, nVlLargura, nVlDiametro, sCdMaoPropria, 
                nVlValorDeclarado, sCdAvisoRecebimento);
            string mensagemErro = resultado.Servicos[0].MsgErro;
            if (!string.IsNullOrEmpty(mensagemErro))
                throw new Exception(mensagemErro);
            return new Frete()
            {
                PrazoEntrega = Convert.ToInt32(resultado.Servicos[0].PrazoEntrega),
                Valor = Convert.ToDecimal(resultado.Servicos[0].Valor)
            };
        }

        private Dimensoes CalcularDimensoesPacote(IList<ItemPedido> itensPedido)
        {
            return new Dimensoes() {
                Altura = itensPedido.Max(ip => ip.Livro.Dimensoes.Altura),
                Largura = itensPedido.Max(ip => ip.Livro.Dimensoes.Largura),
                Profundidade = itensPedido.Sum(ip => ip.Livro.Dimensoes.Profundidade * ip.Quantidade),
                Peso = itensPedido.Sum(ip => ip.Livro.Dimensoes.Peso * ip.Quantidade)
            };
        }
    }
}
