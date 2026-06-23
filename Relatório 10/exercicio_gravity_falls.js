class Criatura {
    constructor(nome, perigo) {
        this.nome = nome;
        this.perigo = perigo;
    }
}

class Diario {
    constructor() {
        this._criaturas = [];
    }

    registrarCriatura(criatura) {
        this._criaturas.push(criatura);
        console.log(`Criatura registrada: ${criatura.nome} (Perigo: ${criatura.perigo})`);
    }

    listarCriaturas() {
        console.log("\n=== Diário 3 - Criaturas Registradas ===");
        this._criaturas.forEach(c => {
            console.log(`- ${c.nome} | Nível de perigo: ${c.perigo}`);
        });
    }
}

class Personagem {
    constructor(nome) {
        this.nome = nome;
    }
}

class CabanaMisterio {
    constructor(personagens) {
        this._personagens = personagens;
    }

    listarFuncionarios() {
        console.log("\n=== Cabana do Mistério - Funcionários ===");
        this._personagens.forEach(p => {
            console.log(`- ${p.nome}`);
        });
    }
}

const diario = new Diario();

const gnomo = new Criatura("Gnomo", "Médio");
const summerween = new Criatura("Monstro Summerween", "Alto");
const unicornio = new Criatura("Unicórnio Maligno", "Extremo");

diario.registrarCriatura(gnomo);
diario.registrarCriatura(summerween);
diario.registrarCriatura(unicornio);

diario.listarCriaturas();

const stan = new Personagem("Grunkle Stan");
const mabel = new Personagem("Mabel");
const soos = new Personagem("Soos");

const cabana = new CabanaMisterio([stan, mabel, soos]);
cabana.listarFuncionarios();
