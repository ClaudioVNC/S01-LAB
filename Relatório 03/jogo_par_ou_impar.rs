use std::io;

fn eh_impar(numero: i32) -> bool {
    numero % 2 != 0
}

fn ler_texto() -> String {
    let mut entrada = String::new();
    io::stdin()
        .read_line(&mut entrada)
        .expect("Erro ao ler entrada");
    entrada.trim().to_lowercase()
}

fn ler_i32() -> i32 {
    loop {
        let mut entrada = String::new();
        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(valor) => return valor,
            Err(_) => {
                println!("Numero invalido. Tente novamente:");
            }
        }
    }
}

fn main() {
    println!("Jogador 1, escolha: par ou impar");
    let escolha_j1 = loop {
        let escolha = ler_texto();
        if escolha == "par" || escolha == "impar" {
            break escolha;
        }
        println!("Escolha invalida. Digite apenas 'par' ou 'impar':");
    };

    println!("Jogador 1, digite seu numero (i32):");
    let numero_j1 = ler_i32();

    println!("Jogador 2, digite seu numero (i32):");
    let numero_j2 = ler_i32();

    let soma = numero_j1 + numero_j2;
    let soma_impar = eh_impar(soma);

    let jogador1_venceu = (escolha_j1 == "impar" && soma_impar) || (escolha_j1 == "par" && !soma_impar);

    println!("\nResultado:");
    println!("Jogador 1 escolheu: {}", escolha_j1);
    println!("Numero do Jogador 1: {}", numero_j1);
    println!("Numero do Jogador 2: {}", numero_j2);
    println!("Soma: {} ({})", soma, if soma_impar { "impar" } else { "par" });

    if jogador1_venceu {
        println!("Vencedor: Jogador 1");
    } else {
        println!("Vencedor: Jogador 2");
    }
}
