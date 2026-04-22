from abc import ABC, abstractmethod


class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self) -> None:
        pass


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self) -> None:
        print(f"{self.nome} ({self.funcao}) usa uma barreira protetora gigante!")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self) -> None:
        print(f"{self.nome} ({self.funcao}) dispara um ataque devastador em area!")


if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt"),
        Dano("Tracer"),
        Tanque("Winston"),
        Dano("Soldier: 76"),
    ]

    for heroi in herois:
        heroi.usar_ultimate()
