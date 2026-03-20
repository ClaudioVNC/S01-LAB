use std::io::{self, Write};

fn verificar_senha(senha: &str) -> bool {
    if senha.chars().count() < 10 {
        return false;
    }

    let mut quantidade_numeros = 0;
    let mut tem_maiuscula = false;

    for c in senha.chars() {
        if c.is_ascii_digit() {
            quantidade_numeros += 1;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }

    quantidade_numeros >= 2 && tem_maiuscula
}

fn main() {
    loop {
        print!("Digite uma senha: ");
        io::stdout().flush().expect("Falha ao exibir o prompt");

        let mut entrada = String::new();
        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler a senha");

        let senha = entrada.trim();

        if verificar_senha(senha) {
            println!("A senha e valida, seja bem vindo!");
            break;
        } else {
            println!("Senha invalida. Tente novamente.");
        }
    }
}
