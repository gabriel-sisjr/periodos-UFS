package ED;

import Grafo.Cidade;
import Grafo.Mapa;

public class Fila {
    private int tamanho;
    private Cidade[] cidades;
    private int inicio;
    private int fim;
    private int numeroElementos;

    public Fila(int tamanho) {
        this.tamanho = tamanho;
        cidades = new Cidade[tamanho];
        inicio = 0;
        fim = -1;
        numeroElementos = 0;

    }

    public void enfileirar(Cidade cidade) {
        if (!filaCheia()) {
            if (fim == tamanho - 1) {
                fim = -1;
            }
            cidades[++fim] = cidade;
            numeroElementos++;
            System.out.println(cidade.getNome());
        } else {
            System.out.println("A fila ja está cheia");

        }

    }

    public Cidade desenfileirar() {
        if (!filaVazia()) {
            Cidade temp = cidades[inicio++];
            if (inicio == tamanho) {
                inicio = 0;
            }

            numeroElementos--;
            return temp;
        } else {
            System.out.println("A fila já está vazia");
            return null;
        }
    }

    public Cidade getPrimeiro() {
        return cidades[inicio];
    }

    public boolean filaVazia() {
        return (numeroElementos == 0);
    }

    public boolean filaCheia() {
        return (numeroElementos == tamanho);
    }

    public int getNumeroElementos() {
        return numeroElementos;
    }

    public static void main(String args[]) {
        Fila fila = new Fila(21);
        Mapa mapa = new Mapa();
    }
}
