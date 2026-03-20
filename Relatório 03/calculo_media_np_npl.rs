use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let npt = (nota1 + nota2) / 2.0;
    let npl = nota3;
    (npt * 0.7) + (npl * 0.3)
}

fn ler_f64() -> f64 {
    loop {
        let mut entrada = String::new();
        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler entrada");

        match entrada.trim().parse::<f64>() {
            Ok(valor) => return valor,
            Err(_) => println!("Valor invalido. Digite novamente:"),
        }
    }
}

fn main() {
    println!("Digite a nota da NP1:");
    let np1 = ler_f64();

    println!("Digite a nota da NP2:");
    let np2 = ler_f64();

    println!("Digite a nota da NPL:");
    let npl = ler_f64();

    let npt = (np1 + np2) / 2.0;
    let media_final = calcular_media(np1, np2, npl);

    println!("NPT: {:.2}", npt);
    println!("NPL: {:.2}", npl);
    println!("Media final: {:.2}", media_final);

    if npt >= 60.0 && npl >= 60.0 {
        println!("Parabens! Voce foi aprovado.");
    } else {
        println!("Voce foi reprovado.");
    }
}
