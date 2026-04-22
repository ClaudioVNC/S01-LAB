class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._resistencia = int(resistencia)
        self._vida = 0
        self.vida = vida

    @property
    def vida(self) -> int:
        return self._vida

    @vida.setter
    def vida(self, valor: int) -> None:
        if not isinstance(valor, int):
            raise TypeError("A vida deve ser um inteiro.")
        if valor < 0:
            raise ValueError("A vida nao pode ser negativa.")
        self._vida = valor

    def __str__(self) -> str:
        return f"Personagem com {self._vida} de vida."


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = bool(armadura_pesada)

    def __str__(self) -> str:
        tipo_armadura = "com" if self.armadura_pesada else "sem"
        return (
            f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistencia "
            f"e {tipo_armadura} armadura pesada."
        )


if __name__ == "__main__":
    personagem = Personagem(100, 50)
    cavaleiro = Cavaleiro(120, 80, True)

    print(personagem)
    print(cavaleiro)

    personagem.vida = 90
    print(f"Vida atualizada do personagem: {personagem.vida}")
