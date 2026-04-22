from abc import ABC, abstractmethod


class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self) -> None:
        pass


class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self) -> str:
        return f"Implante(funcao={self.funcao}, custo={self.custo})"


class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        # Composicao: o implante e criado e gerenciado internamente pelo NetRunner.
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self) -> None:
        print(
            f"{self.nome} executa hack usando {self.implante.funcao} "
            f"(custo: {self.implante.custo} eddies)."
        )


class Faccao:
    def __init__(self, membros: list[Cibernetico]):
        # Agregacao: recebe objetos Cibernetico criados externamente.
        self.membros = membros

    def adicionar_membro(self, membro: Cibernetico) -> None:
        self.membros.append(membro)

    def executar_hacks(self) -> None:
        print("=== Operacao de Hack da Faccao ===")
        for membro in self.membros:
            membro.realizar_hack()


if __name__ == "__main__":
    netrunner_1 = NetRunner("V", 8000, "Sandevistan")
    netrunner_2 = NetRunner("Lucy", 6500, "Monofio")
    netrunner_3 = NetRunner("T-Bug", 7200, "Cyberdeck")

    faccao = Faccao([])
    faccao.adicionar_membro(netrunner_1)
    faccao.adicionar_membro(netrunner_2)
    faccao.adicionar_membro(netrunner_3)

    faccao.executar_hacks()
