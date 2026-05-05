// Interface simulada
class Habilidade {
    usar() {
        throw new Error("O método usar() deve ser sobrescrito pela subclasse.");
    }
}

class Smoke extends Habilidade {
    usar() {
        console.log("Lançando cortina de fumaça para bloquear a visão inimiga!");
    }
}

class Flash extends Habilidade {
    usar() {
        console.log("Disparando flash para cegar os inimigos!");
    }
}

class Dash extends Habilidade {
    usar() {
        console.log("Executando dash para reposicionar rapidamente!");
    }
}

class Armadilha extends Habilidade {
    usar() {
        console.log("Posicionando armadilha para detectar e prender inimigos!");
    }
}

// Composição
class Agente {
    constructor(nome, funcao, habilidade) {
        this.nome = nome;
        this.funcao = funcao;
        this._habilidade = habilidade;
    }

    entrarEmCombate() {
        console.log(`Agente: ${this.nome} | Função: ${this.funcao}`);
        this._habilidade.usar();
    }
}

// Main
const omen = new Agente("Omen", "Controlador", new Smoke());
const phoenix = new Agente("Phoenix", "Duelista", new Flash());
const jett = new Agente("Jett", "Duelista", new Dash());
const cypher = new Agente("Cypher", "Sentinela", new Armadilha());

console.log("=== Time de Valorant entrando em combate ===\n");
omen.entrarEmCombate();
console.log();
phoenix.entrarEmCombate();
console.log();
jett.entrarEmCombate();
console.log();
cypher.entrarEmCombate();
