package Grafo;

import java.util.ArrayList;
import java.util.List;
import java.awt.geom.*;

public class Cidade {
    private String nome;
    private boolean visitado;
    private List<Adjacente> adjacenteList;

    public Cidade(String nome) {
        this.nome = nome;
        visitado = false;
        adjacenteList = new ArrayList<Adjacente>();

    }

    public Cidade() {

    }

    public void addCidadeAdjacente(Adjacente cidade) {
//        Cidade c = new Cidade();
//        c.setNome(cidade.getCidade().getNome());
//        c.setVisitado(cidade.getCidade().isVisitado());
//        cidade.setCidade(c);
        adjacenteList.add(cidade);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public boolean isVisitado() {
        return visitado;
    }

    public void setVisitado(boolean visitado) {
        this.visitado = visitado;
    }

    public List<Adjacente> getAdjacentes() {
        return adjacenteList;
    }
}
