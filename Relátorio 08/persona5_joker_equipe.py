class ArmaCorpoACorpo:
    def __init__(self, nome_arma: str):
        self.nome_arma = nome_arma

    def __str__(self) -> str:
        return f"Arma corpo a corpo: {self.nome_arma}"


class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self) -> str:
        return f"Membro: {self.nome} | Arma: {self.arma}"


class Joker:
    def __init__(self, nome_arma: str, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo(nome_arma)

        self.equipe = equipe

    def mostrar_equipe(self) -> None:
        print("=== Phantom Thieves ===")
        print(self.arma)
        for membro in self.equipe:
            print(membro)


if __name__ == "__main__":
    equipe_joker = [
        PhantomThieves("Skull", "Bastao"),
        PhantomThieves("Panther", "Chicote"),
        PhantomThieves("Fox", "Katana"),
    ]

    joker = Joker("Faca", equipe_joker)
    joker.mostrar_equipe()
