# IA Report — Relatório 11

Registo dos prompts utilizados durante a resolução dos exercícios e o código gerado pela IA em resposta a cada um.

---

## Prompt 1

**Exercício:** 1 e 4  
**Prompt enviado:**
> como eu faço uma classe abstrata em java? tipo, quero que ela tenha um método que as classes filhas sejam obrigadas a implementar

**Código adicionado pela IA:**

```java
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
```

```java
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
```

---

## Prompt 2

**Exercício:** 3  
**Prompt enviado:**
> preciso usar um HashMap pra guardar entidades usando o nome como chave, e se alguém tentar registrar com o mesmo nome duas vezes, tem que bloquear e mostrar um aviso

**Código adicionado pela IA:**

```java
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
}
```

---

## Prompt 3

**Exercício:** 3  
**Prompt enviado:**
> como eu listo tudo que tem dentro de um HashMap usando for-each em java? e como eu verifico se um objeto é de um certo tipo antes de chamar um método dele?

**Código adicionado pela IA:**

```java
public void listarEntidades() {
    System.out.println("\n--- Registro de Entidades Ocultas ---");
    for (Map.Entry<String, Entidade> entrada : mapa.entrySet()) {
        Entidade entidade = entrada.getValue();
        if (entidade instanceof Rastreavel rastreavel) {
            System.out.println(rastreavel.obterCoordenadas());
        }
    }
}
```

---

## Prompt 4

**Exercício:** 1 e 4  
**Prompt enviado:**
> como eu faço o toString em java? quero que quando eu imprimir o objeto ele mostre as informações certinho sem precisar chamar nenhum método manualmente

**Código adicionado pela IA:**

```java
public String toString() {
    return "Divisão: " + nome + " | Função: " + funcao;
}
```

```java
public String toString() {
    return nome + " (" + quantidade + ")";
}
```

---

## Prompt 5

**Exercício:** 2  
**Prompt enviado:**
> tem como formatar a saída do println em colunas? tipo, quero que o nome do café fique alinhado à esquerda e o preço alinhado à direita com duas casas decimais

**Código adicionado pela IA:**

```java
public void exibirMenu() {
    System.out.println("--- Cardápio ---");
    for (Cafe cafe : cafes) {
        System.out.printf("%-25s R$ %.2f%n", cafe.getNome(), cafe.calcularPrecoFinal());
    }
}
```
