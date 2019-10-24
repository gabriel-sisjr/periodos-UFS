package Busca;

import ED.Fila;
import Grafo.Adjacente;
import Grafo.Cidade;
import Grafo.Mapa;



public class Largura {
    private Fila fronteira;
    private Cidade inicio;
    private Cidade objetivo;
    private Cidade ultima;
    private boolean achou;
    private Mapa mapa;
    int cont = 0;

    public Largura(Cidade inicio, Cidade objetivo) {
        this.inicio = inicio;
        this.inicio.setVisitado(true);
        this.objetivo = objetivo;
        //this.mapa = mapa;

        fronteira = new Fila(20);
        fronteira.enfileirar(inicio);
        ultima = inicio;
        achou = false;
    }

    public void buscar01() {
        do {
            Cidade primeiro = fronteira.getPrimeiro();
            System.out.println("Primeiro: " + primeiro.getNome());
//            for(int i = 0;
//                i < primeiro.getAdjacentes().size() && (!primeiro.isVisitado() == true);
//                i++){
//                Adjacente atual = primeiro.getAdjacentes().get(i);
//                if(atual.getCidade().getNome().equals(objetivo.getNome())){
//                    System.out.println(objetivo.getNome());
//                    return;
//                } else {
//                    fronteira.enfileirar(atual.getCidade());
//                }
//            }

            for (Adjacente a : primeiro.getAdjacentes()) {
                if (a.getCidade().getNome().equals(objetivo.getNome())) {
                    System.out.println(objetivo.getNome());
                    return;
                } else {
                    fronteira.enfileirar(a.getCidade());
                }
            }
            primeiro.setVisitado(true);
            fronteira.desenfileirar();
        } while(!fronteira.getPrimeiro().equals(objetivo.getNome()));


//        if (primeiro.equals(objetivo)) {
//            achou = true;
//
//        } else {
//            System.out.println("Desenfileirou: " + fronteira.desenfileirar().getNome());
//            for (Adjacente a : primeiro.getAdjacentes()) {
//                System.out.println("Verificando se já visitado: " + a.getCidade().getNome());
//                if (!a.getCidade().isVisitado()) {
//                    a.getCidade().setVisitado(true);
//                    fronteira.enfileirar(a.getCidade());
//                }
//            }
//            if (fronteira.getNumeroElementos() > 0) {
//                buscar01();
//            }
//        }
    }
    private boolean pesquisaVisitados()
    {
        for(Cidade c : mapa.getCidades()){
            if(!c.isVisitado()){
                return false;
            }
        }
        return true;
    }

    private boolean VerificaTrue(String nome)
    {
        for(Cidade c : mapa.getCidades()){
            if(c.getNome().equals(nome)){
                if (c.isVisitado()){
                    return true;
                }
            }
        }
        return false;
    }

    private void setTrue(String nome)
    {
        for(Cidade c : mapa.getCidades()){
            if(c.getNome().equals(nome)){
                c.setVisitado(true);
            }
        }
    }

    private Cidade PesquisaCidadeNome(String nome)
    {
        for(Cidade c : mapa.getCidades()){
            if(c.getNome().equals(nome)){
                return c;
            }
        }
        return null;
    }

}
