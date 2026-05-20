import java.util.HashMap;
import java.util.Map;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;
    private int intensidade;

    public Poder(String nome, int intensidade) {
        this.nome = nome;
        this.intensidade = intensidade;
    }

    public String getNome() {
        return nome;
    }

    public int getIntensidade() {
        return intensidade;
    }
}

class Entidade {
    private String nome;

    public Entidade(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Alien extends Entidade implements Rastreavel {
    private Poder poder;

    public Alien(String nome, String nomePoder, int intensidade) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidade);
    }

    public String obterCoordenadas() {
        return "[Alien] " + getNome() + " | Poder: " + poder.getNome()
                + " (intensidade " + poder.getIntensidade() + ")"
                + " | Coords: (10, 42)";
    }
}

class Youkai extends Entidade implements Rastreavel {
    private Poder poder;

    public Youkai(String nome, String nomePoder, int intensidade) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidade);
    }

    public String obterCoordenadas() {
        return "[Youkai] " + getNome() + " | Poder: " + poder.getNome()
                + " (intensidade " + poder.getIntensidade() + ")"
                + " | Coords: (35, 78)";
    }
}

class RegistroOculto {
    private HashMap<String, Entidade> mapa;

    public RegistroOculto() {
        this.mapa = new HashMap<>();
    }

    public void registrarEntidade(Entidade entidade) {
        String chave = entidade.getNome();
        if (mapa.containsKey(chave)) {
            System.out.println("AVISO: \"" + chave + "\" já está registrado. Registro ignorado.");
        } else {
            mapa.put(chave, entidade);
            System.out.println("Entidade \"" + chave + "\" registrada com sucesso.");
        }
    }

    public void listarEntidades() {
        System.out.println("\n--- Registro de Entidades Ocultas ---");
        for (Map.Entry<String, Entidade> entrada : mapa.entrySet()) {
            Entidade entidade = entrada.getValue();
            if (entidade instanceof Rastreavel rastreavel) {
                System.out.println(rastreavel.obterCoordenadas());
            }
        }
    }
}

public class exercicio_detetives_ocultos {
    public static void main(String[] args) {
        Alien alien1 = new Alien("Zyx-9", "Raio Plasma", 85);
        Alien alien2 = new Alien("Korg-4", "Campo Gravitacional", 70);
        Youkai youkai1 = new Youkai("Tengu", "Ventania Sombria", 90);
        Youkai youkai2 = new Youkai("Kappa", "Ilusão Aquática", 60);

        RegistroOculto registro = new RegistroOculto();

        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);

        System.out.println("\nTentando registrar \"Tengu\" novamente...");
        registro.registrarEntidade(youkai1);

        registro.listarEntidades();
    }
}
