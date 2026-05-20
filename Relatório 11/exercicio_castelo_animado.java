import java.util.ArrayList;

abstract class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public abstract void apresentar();
}

class Mago extends Personagem {

    public Mago(String nome, int idade) {
        super(nome, idade);
    }

    public void apresentar() {
        System.out.println("Meu nome é " + getNome() + " e tenho " + getIdade() + " anos.");
        System.out.println("Sou um poderoso mago capaz de mover castelos inteiros com magia!");
    }
}

class Divisao {
    private String nome;
    private String funcao;

    public Divisao(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }

    public String getNome() {
        return nome;
    }

    public String getFuncao() {
        return funcao;
    }

    public String toString() {
        return "Divisão: " + nome + " | Função: " + funcao;
    }
}

class CasteloAnimado {
    private ArrayList<Divisao> divisoes;

    public CasteloAnimado() {
        this.divisoes = new ArrayList<>();
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }

    public void listarDivisoes() {
        System.out.println("\n--- Divisões do Castelo Animado ---");
        for (Divisao divisao : divisoes) {
            System.out.println(divisao);
        }
    }
}

public class exercicio_castelo_animado {
    public static void main(String[] args) {
        Mago howl = new Mago("Howl", 27);
        howl.apresentar();

        Divisao quarto = new Divisao("Quarto", "Descanso e dormitório");
        Divisao laboratorio = new Divisao("Laboratório", "Pesquisa e experimentos");
        Divisao sala = new Divisao("Sala de Estar", "Convivência e recepção de visitantes");

        CasteloAnimado castelo = new CasteloAnimado();
        castelo.adicionarDivisao(quarto);
        castelo.adicionarDivisao(laboratorio);
        castelo.adicionarDivisao(sala);

        castelo.listarDivisoes();
    }
}
