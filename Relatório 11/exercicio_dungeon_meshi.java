import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void virarPrato();
}

class Lagosta extends Monstro {

    public Lagosta(String nome) {
        super(nome);
    }

    public void virarPrato() {
        System.out.println("Senshi prepara a lagosta " + getNome() + " grelhada.");
    }
}

class Cogumelo extends Monstro {

    public Cogumelo(String nome) {
        super(nome);
    }

    public void virarPrato() {
        System.out.println("Senshi refoga o cogumelo " + getNome() + " com azeite e alho.");
    }
}

class Tempero {
    private String nome;
    private String quantidade;

    public Tempero(String nome, String quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    public String toString() {
        return nome + " (" + quantidade + ")";
    }
}

class Prato {
    private String nome;
    private Monstro monstro;
    private Tempero tempero;

    public Prato(String nome, Monstro monstro, String nomeTemplero, String quantidade) {
        this.nome = nome;
        this.monstro = monstro;
        this.tempero = new Tempero(nomeTemplero, quantidade);
    }

    public void servir() {
        System.out.println("\n=== " + nome + " ===");
        monstro.virarPrato();
        System.out.println("Tempero usado: " + tempero);
    }
}

public class exercicio_dungeon_meshi {
    public static void main(String[] args) {
        Lagosta lagosta = new Lagosta("Lagosta");
        Cogumelo cogumelo = new Cogumelo("Cogumelo");

        Prato pratoLagosta = new Prato("Lagosta Grelhada", lagosta, "Sal", "1 pitada");
        Prato pratoCogumelo = new Prato("Cogumelo Salteado", cogumelo, "Azeite", "2 colheres");

        pratoLagosta.servir();
        pratoCogumelo.servir();

        System.out.println("\n\n--- Cardápio da Expedição ---");
        ArrayList<Prato> cardapio = new ArrayList<>();
        cardapio.add(pratoLagosta);
        cardapio.add(pratoCogumelo);

        for (Prato prato : cardapio) {
            prato.servir();
        }
    }
}
