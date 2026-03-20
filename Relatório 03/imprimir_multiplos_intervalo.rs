use std::io::{self, Write};

fn imprimir_multiplos(numero: i32, limite_inferior: i32, limite_superior: i32) {
    if numero == 0 {
        println!("Nao existe divisao por zero.");
        return;
    }

    for valor in limite_inferior..=limite_superior {
        if valor % numero == 0 {
            println!("{}", valor);
        }
    }
}

fn ler_i32(mensagem: &str) -> i32 {
    loop {
        print!("{}", mensagem);
        io::stdout().flush().expect("Falha ao exibir prompt");

        let mut entrada = String::new();
        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler entrada");

        match entrada.trim().parse::<i32>() {
            Ok(valor) => return valor,
            Err(_) => println!("Valor invalido. Digite um numero inteiro."),
        }
    }
}

fn main() {
    let numero = ler_i32("Digite o numero da tabuada: ");
    let limite_inferior = ler_i32("Digite o limite inferior: ");
    let limite_superior = ler_i32("Digite o limite superior: ");

    imprimir_multiplos(numero, limite_inferior, limite_superior);
}
