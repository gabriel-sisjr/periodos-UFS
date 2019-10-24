package Busca;

import ED.Pilha;
import Grafo.Adjacente;
import Grafo.Cidade;
import Grafo.Mapa;

public class Profundidade {
    private Pilha fronteira;
    private Cidade inicio;
    private Cidade objetivo;
    private boolean achou;

    public Profundidade(Cidade inicio, Cidade objetivo) {
        this.inicio = inicio;
        this.inicio.setVisitado(true);
        this.objetivo = objetivo;

        fronteira = new Pilha(20);
        fronteira.empilhar(inicio);
        achou = false;
    }

    public void buscar() {
        Cidade topo = fronteira.getTopo();
        System.out.println("Topo: " + topo.getNome());

        if (topo.equals(objetivo)) {
            achou = true;

        } else {
            for (Adjacente a : topo.getAdjacentes()) {
                if (!achou) {
                    System.out.println("Verificando se já visitado: " + a.getCidade().getNome());
                    if (a.getCidade().isVisitado() == false) {
                        a.getCidade().setVisitado(true);
                        fronteira.empilhar(a.getCidade());
                        buscar();
                    }
                }
            }
        }
        System.out.println("Desempilhou: " + fronteira.desempilhar().getNome());
    }

}
