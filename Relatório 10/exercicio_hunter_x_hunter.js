class Hunter {
    constructor(nome) {
        this.nome = nome;
    }

    lutar() {
        console.log(`${this.nome} usou um ataque genérico!`);
    }
}

class Gon extends Hunter {
    constructor() {
        super("Gon");
    }

    lutar() {
        console.log(`${this.nome} usou Jajanken - Pedra! 👊`);
    }
}

class Killua extends Hunter {
    constructor() {
        super("Killua");
    }

    lutar() {
        console.log(`${this.nome} ativou Godspeed e atacou em velocidade relâmpago! ⚡`);
    }
}

class Kurapika extends Hunter {
    constructor() {
        super("Kurapika");
    }

    lutar() {
        console.log(`${this.nome} prendeu o inimigo com suas Correntes Imperativas! ⛓️`);
    }
}

class TrupeFantasma {
    constructor(nome, membros) {
        this.nome = nome;
        this._membros = membros;
    }

    revelarMembros() {
        console.log(`\n=== ${this.nome} ===`);
        this._membros.forEach(m => {
            console.log(`- ${m}`);
        });
    }
}

const gon = new Gon();
const killua = new Killua();
const kurapika = new Kurapika();

console.log("=== Hunters em ação ===");
gon.lutar();
killua.lutar();
kurapika.lutar();

const trupe = new TrupeFantasma("Trupe Fantasma", ["Chrollo", "Hisoka", "Feitan"]);
trupe.revelarMembros();
