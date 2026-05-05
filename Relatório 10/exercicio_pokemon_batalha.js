class Pokemon {
    constructor(nome, tipo) {
        this.nome = nome;
        this.tipo = tipo;
        this._vida = 100;
    }

    get vida() {
        return this._vida;
    }

    atacar() {
        console.log(`${this.nome} usou um ataque genérico!`);
    }

    receberDano(dano) {
        if (dano < 0) return;
        this._vida = Math.max(0, this._vida - dano);
        console.log(`${this.nome} recebeu ${dano} de dano! Vida restante: ${this._vida}`);
    }
}

class Pikachu extends Pokemon {
    constructor() {
        super("Pikachu", "Elétrico");
    }

    atacar() {
        console.log(`${this.nome} usou Raio Trovão! ⚡`);
    }
}

class Charizard extends Pokemon {
    constructor() {
        super("Charizard", "Fogo/Voador");
    }

    atacar() {
        console.log(`${this.nome} usou Lança-Chamas! 🔥`);
    }
}

// Main
const pikachu = new Pikachu();
const charizard = new Charizard();

pikachu.atacar();
charizard.atacar();

charizard.receberDano(40);
console.log(`Vida atual de ${charizard.nome}: ${charizard.vida}`);

pikachu.receberDano(120); // tenta causar mais dano do que a vida disponível
console.log(`Vida atual de ${pikachu.nome}: ${pikachu.vida}`);
