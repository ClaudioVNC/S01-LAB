import java.util.ArrayList;

class Cafe {
    private String nome;
    private double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double calcularPrecoFinal() {
        return preco;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    public double calcularPrecoFinal() {
        return getPreco() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> cafes;

    public Menu() {
        this.cafes = new ArrayList<>();
    }

    public void adicionarCafe(Cafe cafe) {
        cafes.add(cafe);
    }

    public void exibirMenu() {
        System.out.println("--- Cardápio ---");
        for (Cafe cafe : cafes) {
            System.out.printf("%-25s R$ %.2f%n", cafe.getNome(), cafe.calcularPrecoFinal());
        }
    }
}

class CafeteriaLeblanc {
    private Menu menu;

    public CafeteriaLeblanc() {
        this.menu = new Menu();
    }

    public void adicionarCafe(Cafe cafe) {
        menu.adicionarCafe(cafe);
    }

    public void abrirCafeteria() {
        System.out.println("Bem-vindo ao Leblanc! Sinta-se em casa.");
        System.out.println("Aproveite nosso cardápio!\n");
        menu.exibirMenu();
    }
}

public class exercicio_leblanc {
    public static void main(String[] args) {
        Cafe cafeSimples = new Cafe("Café Coado", 8.50);
        Cafe espresso = new Cafe("Espresso Curto", 10.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Blend Especial", 15.00, 7.50);

        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();
        leblanc.adicionarCafe(cafeSimples);
        leblanc.adicionarCafe(espresso);
        leblanc.adicionarCafe(cafeGourmet);

        leblanc.abrirCafeteria();
    }
}
