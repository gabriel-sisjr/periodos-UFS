package Grafo;

//import java.awt.geom.Area;

import javax.sql.rowset.CachedRowSet;
import java.util.ArrayList;

public class Mapa {
    // Caso crescer o numero de Cidades alterar no APP, no combobox, atual = 22
    private Cidade Itabaiana;
    private Cidade Aracaju;
    private Cidade Areia_Branca;
    private Cidade Ribeiropolis;
    private Cidade Frei_Paulo;
    private Cidade Laranjeiras;
    private Cidade Malhador;
    private Cidade Lagarto;
    private Cidade Estancia;
    private Cidade Moita_Bonita;
    private Cidade Macambira;
    private Cidade Nossa_Senhora_aparecida;
    private Cidade Nossa_Senhora_da_Gloria;
    private Cidade Nossa_Senhora_das_Dores;
    private Cidade Nossa_Senhora_do_Socorro;
    private Cidade Pedra_Mole;
    private Cidade Pinhao;
    private Cidade Riachuelo;
    private Cidade Sao_Domingos;
    private Cidade Sao_Cristovao;
    private Cidade Carira;
    private Cidade Simao_Dias;

    private ArrayList<Cidade> Cidades;

    public Mapa() {
        Cidades = new ArrayList<>();
        Itabaiana = new Cidade("Itabaiana");
        Frei_Paulo = new Cidade("Frei Paulo");
        Moita_Bonita = new Cidade("Moita Bonita");
        Lagarto = new Cidade("Lagarto");
        Laranjeiras = new Cidade("Laranjeiras");
        Macambira = new Cidade("Macambira");
        Malhador = new Cidade("Malhador");
        Nossa_Senhora_aparecida = new Cidade("Nossa Senhora de Aparecida");
        Nossa_Senhora_da_Gloria = new Cidade("Gloria");
        Nossa_Senhora_das_Dores = new Cidade("Nossa Senhora das Dores");
        Nossa_Senhora_do_Socorro = new Cidade("Nossa Senhora do Socorro");
        Pedra_Mole = new Cidade("Pedra Mole");
        Pinhao = new Cidade("Pinhao");
        Riachuelo = new Cidade("Riachuelo");
        Ribeiropolis = new Cidade("Ribeiropolis");
        Sao_Cristovao = new Cidade("São Cristovão");
        Sao_Domingos = new Cidade("São Domingos");
        Carira = new Cidade("Carira");
        Areia_Branca = new Cidade("Areia Branca");
        Aracaju = new Cidade("Aracaju");
        Simao_Dias = new Cidade("Simao Dias");

        Cidades.add(Itabaiana);
        Cidades.add(Frei_Paulo);
        Cidades.add(Moita_Bonita);
        Cidades.add(Lagarto);
        Cidades.add(Laranjeiras);
        Cidades.add(Macambira);
        Cidades.add(Malhador);
        Cidades.add(Nossa_Senhora_aparecida);
        Cidades.add(Nossa_Senhora_da_Gloria);
        Cidades.add(Nossa_Senhora_das_Dores);
        Cidades.add(Nossa_Senhora_do_Socorro);
        Cidades.add(Pedra_Mole);
        Cidades.add(Pinhao);
        Cidades.add(Riachuelo);
        Cidades.add(Ribeiropolis);
        Cidades.add(Sao_Cristovao);
        Cidades.add(Sao_Domingos);
        Cidades.add(Carira);
        Cidades.add(Areia_Branca);
        Cidades.add(Aracaju);
        Cidades.add(Simao_Dias);

        /* Adj de Itabaiana */
        Itabaiana.addCidadeAdjacente(new Adjacente(Areia_Branca));
        Itabaiana.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Itabaiana.addCidadeAdjacente(new Adjacente(Moita_Bonita));
        Itabaiana.addCidadeAdjacente(new Adjacente(Macambira));
        Itabaiana.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Itabaiana.addCidadeAdjacente(new Adjacente(Malhador));

        /*Adj de Frei Paulo*/
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Pinhao));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Itabaiana));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Macambira));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Frei_Paulo.addCidadeAdjacente(new Adjacente(Ribeiropolis));

        /*Adj de Moita Bonita*/
        Moita_Bonita.addCidadeAdjacente(new Adjacente(Itabaiana));
        Moita_Bonita.addCidadeAdjacente(new Adjacente(Malhador));
        Moita_Bonita.addCidadeAdjacente(new Adjacente(Nossa_Senhora_das_Dores));
        Moita_Bonita.addCidadeAdjacente(new Adjacente(Ribeiropolis));

        /*Adj de Lagarto*/
        Lagarto.addCidadeAdjacente(new Adjacente(Pinhao));
        Lagarto.addCidadeAdjacente(new Adjacente(Sao_Domingos));
        Lagarto.addCidadeAdjacente(new Adjacente(Simao_Dias));

        /*Adj de Laranjeiras*/
        Laranjeiras.addCidadeAdjacente(new Adjacente(Riachuelo));
        Laranjeiras.addCidadeAdjacente(new Adjacente(Sao_Cristovao));
        Laranjeiras.addCidadeAdjacente(new Adjacente(Areia_Branca));
        Laranjeiras.addCidadeAdjacente(new Adjacente(Aracaju));

        /*Adj de Macambira*/
        Macambira.addCidadeAdjacente(new Adjacente(Itabaiana));
        Macambira.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Macambira.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Macambira.addCidadeAdjacente(new Adjacente(Pinhao));
        Macambira.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Macambira.addCidadeAdjacente(new Adjacente(Sao_Domingos));
        Macambira.addCidadeAdjacente(new Adjacente(Carira));

        /*Adj de Malhador*/
        Malhador.addCidadeAdjacente(new Adjacente(Itabaiana));
        Malhador.addCidadeAdjacente(new Adjacente(Moita_Bonita));
        Malhador.addCidadeAdjacente(new Adjacente(Riachuelo));
        Malhador.addCidadeAdjacente(new Adjacente(Areia_Branca));

        /*Adj de Nossa Senhora Aparacida*/
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Pinhao));
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Nossa_Senhora_aparecida.addCidadeAdjacente(new Adjacente(Carira));

        /*Adj de Nossa Senhora da Gloria*/
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Pinhao));
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Nossa_Senhora_da_Gloria.addCidadeAdjacente(new Adjacente(Carira));

        /*Adj de Nossa Senhora das Dores*/
        Nossa_Senhora_das_Dores.addCidadeAdjacente(new Adjacente(Moita_Bonita));
        Nossa_Senhora_das_Dores.addCidadeAdjacente(new Adjacente(Ribeiropolis));

        /*Adj de Nossa Senhora do Socorro*/
        Nossa_Senhora_do_Socorro.addCidadeAdjacente(new Adjacente(Laranjeiras));
        Nossa_Senhora_do_Socorro.addCidadeAdjacente(new Adjacente(Aracaju));

        /*Adj de Pedra Mole*/
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Macambira));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Pinhao));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Carira));
        Pedra_Mole.addCidadeAdjacente(new Adjacente(Simao_Dias));

        /*Adj de Pinhao */

        Pinhao.addCidadeAdjacente(new Adjacente(Simao_Dias));
        Pinhao.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Pinhao.addCidadeAdjacente(new Adjacente(Lagarto));
        Pinhao.addCidadeAdjacente(new Adjacente(Macambira));
        Pinhao.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Pinhao.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Pinhao.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Pinhao.addCidadeAdjacente(new Adjacente(Ribeiropolis));
        Pinhao.addCidadeAdjacente(new Adjacente(Carira));


        /*Adj de Riachuelo*/
        Riachuelo.addCidadeAdjacente(new Adjacente(Laranjeiras));
        Riachuelo.addCidadeAdjacente(new Adjacente(Malhador));
        Riachuelo.addCidadeAdjacente(new Adjacente(Areia_Branca));
        Riachuelo.addCidadeAdjacente(new Adjacente(Aracaju));

        /*Adj de Ribeiropoles*/
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Itabaiana));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Moita_Bonita));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Macambira));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Nossa_Senhora_das_Dores));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Pinhao));
        Ribeiropolis.addCidadeAdjacente(new Adjacente(Carira));

        /*Adj de São Cristovao*/
        Sao_Cristovao.addCidadeAdjacente(new Adjacente(Laranjeiras));
        Sao_Cristovao.addCidadeAdjacente(new Adjacente(Nossa_Senhora_das_Dores));
        Sao_Cristovao.addCidadeAdjacente(new Adjacente(Nossa_Senhora_do_Socorro));
        Sao_Cristovao.addCidadeAdjacente(new Adjacente(Areia_Branca));
        Sao_Cristovao.addCidadeAdjacente(new Adjacente(Aracaju));

        /*Adj de Sao Domingos*/
        Sao_Domingos.addCidadeAdjacente(new Adjacente(Itabaiana));
        Sao_Domingos.addCidadeAdjacente(new Adjacente(Lagarto));
        Sao_Domingos.addCidadeAdjacente(new Adjacente(Macambira));
        Sao_Domingos.addCidadeAdjacente(new Adjacente(Simao_Dias));
        Sao_Domingos.addCidadeAdjacente(new Adjacente(Itabaiana));

        /*Adj de Carira*/
        Carira.addCidadeAdjacente(new Adjacente(Frei_Paulo));
        Carira.addCidadeAdjacente(new Adjacente(Macambira));
        Carira.addCidadeAdjacente(new Adjacente(Nossa_Senhora_aparecida));
        Carira.addCidadeAdjacente(new Adjacente(Nossa_Senhora_da_Gloria));
        Carira.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Carira.addCidadeAdjacente(new Adjacente(Pinhao));
        Carira.addCidadeAdjacente(new Adjacente(Ribeiropolis));

        /*Adj de Areia Branca*/
        Areia_Branca.addCidadeAdjacente(new Adjacente(Itabaiana));
        Areia_Branca.addCidadeAdjacente(new Adjacente(Aracaju));
        Areia_Branca.addCidadeAdjacente(new Adjacente(Laranjeiras));
        Areia_Branca.addCidadeAdjacente(new Adjacente(Malhador));
        Areia_Branca.addCidadeAdjacente(new Adjacente(Riachuelo));
        Areia_Branca.addCidadeAdjacente(new Adjacente(Sao_Cristovao));


        /*Adj de Simao Dias*/
        Simao_Dias.addCidadeAdjacente(new Adjacente(Lagarto));
        Simao_Dias.addCidadeAdjacente(new Adjacente(Pedra_Mole));
        Simao_Dias.addCidadeAdjacente(new Adjacente(Pinhao));

        /*Adj de Aracaju*/
        Aracaju.addCidadeAdjacente(new Adjacente(Laranjeiras));
        Aracaju.addCidadeAdjacente(new Adjacente(Nossa_Senhora_do_Socorro));
        Aracaju.addCidadeAdjacente(new Adjacente(Riachuelo));
        Aracaju.addCidadeAdjacente(new Adjacente(Sao_Cristovao));
        Aracaju.addCidadeAdjacente(new Adjacente(Areia_Branca));

        //Itabaiana.setNome("Itabaiana Modificada");
    }

    public Cidade criarCidade(String Nome){
       Cidade cidade = new Cidade(Nome);
       return cidade;
    }
    public void setCidade(String cidade){
        if (cidade.equals("itabaiana")){
            getItabaiana();
        }
    }

    public Cidade getItabaiana() {
        return Itabaiana;
    }

    public void setItabaiana(Cidade itabaiana) {
        Itabaiana = itabaiana;
    }

    public Cidade getAracaju() {
        return Aracaju;
    }

    public void setAracaju(Cidade aracaju) {
        Aracaju = aracaju;
    }

    public Cidade getAreia_Branca() {
        return Areia_Branca;
    }

    public void setAreia_Branca(Cidade areia_Branca) {
        Areia_Branca = areia_Branca;
    }

    public Cidade getRibeiropolis() {
        return Ribeiropolis;
    }

    public void setRibeiropolis(Cidade ribeiropolis) {
        Ribeiropolis = ribeiropolis;
    }

    public Cidade getFrei_Paulo() {
        return Frei_Paulo;
    }

    public void setFrei_Paulo(Cidade frei_Paulo) {
        Frei_Paulo = frei_Paulo;
    }

    public Cidade getLaranjeiras() {
        return Laranjeiras;
    }

    public void setLaranjeiras(Cidade laranjeiras) {
        Laranjeiras = laranjeiras;
    }

    public Cidade getMalhador() {
        return Malhador;
    }

    public void setMalhador(Cidade malhador) {
        Malhador = malhador;
    }

    public Cidade getLagarto() {
        return Lagarto;
    }

    public void setLagarto(Cidade lagarto) {
        Lagarto = lagarto;
    }

    public Cidade getEstancia() {
        return Estancia;
    }

    public void setEstancia(Cidade estancia) {
        Estancia = estancia;
    }

    public Cidade getMacambira() {
        return Macambira;
    }

    public void setMacambira(Cidade macambira) {
        Macambira = macambira;
    }

    public Cidade getNossa_Senhora_aparecida() {
        return Nossa_Senhora_aparecida;
    }

    public void setNossa_Senhora_aparecida(Cidade nossa_Senhora_aparecida) {
        Nossa_Senhora_aparecida = nossa_Senhora_aparecida;
    }

    public Cidade getNossa_Senhora_da_Gloria() {
        return Nossa_Senhora_da_Gloria;
    }

    public void setNossa_Senhora_da_Gloria(Cidade nossa_Senhora_da_Gloria) {
        Nossa_Senhora_da_Gloria = nossa_Senhora_da_Gloria;
    }

    public Cidade getNossa_Senhora_das_Dores() {
        return Nossa_Senhora_das_Dores;
    }

    public void setNossa_Senhora_das_Dores(Cidade nossa_Senhora_das_Dores) {
        Nossa_Senhora_das_Dores = nossa_Senhora_das_Dores;
    }

    public Cidade getNossa_Senhora_do_Socorro() {
        return Nossa_Senhora_do_Socorro;
    }

    public void setNossa_Senhora_do_Socorro(Cidade nossa_Senhora_do_Socorro) {
        Nossa_Senhora_do_Socorro = nossa_Senhora_do_Socorro;
    }

    public Cidade getPedra_Mole() {
        return Pedra_Mole;
    }

    public void setPedra_Mole(Cidade pedra_Mole) {
        Pedra_Mole = pedra_Mole;
    }

    public Cidade getPinhao() {
        return Pinhao;
    }

    public void setPinhao(Cidade pinhao) {
        Pinhao = pinhao;
    }

    public Cidade getRiachuelo() {
        return Riachuelo;
    }

    public void setRiachuelo(Cidade riachuelo) {
        Riachuelo = riachuelo;
    }

    public Cidade getSao_Domingos() {
        return Sao_Domingos;
    }

    public void setSao_Domingos(Cidade sao_Domingos) {
        Sao_Domingos = sao_Domingos;
    }

    public Cidade getSao_Cristovao() {
        return Sao_Cristovao;
    }

    public void setSao_Cristovao(Cidade sao_Cristovao) {
        Sao_Cristovao = sao_Cristovao;
    }

    public Cidade getCarira() {
        return Carira;
    }

    public void setCarira(Cidade carira) {
        Carira = carira;
    }

    public Cidade getSimao_Dias() {
        return Simao_Dias;
    }

    public void setSimao_Dias(Cidade simao_Dias) {
        Simao_Dias = simao_Dias;
    }

    public Cidade getMoita_Bonita() {
        return Moita_Bonita;
    }

    public void setMoita_Bonita(Cidade moita_Bonita) {
        Moita_Bonita = moita_Bonita;
    }

    public ArrayList<Cidade> getCidades() {
        return Cidades;
    }

    public void setCidades(ArrayList<Cidade> cidades) {
        Cidades = cidades;
    }
}