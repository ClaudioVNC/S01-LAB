package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func ValidarUsuario(nome string) (bool, string) {
	if len(nome) >= 8 {
		return true, "Usuário criado com sucesso!"
	}
	return false, "Erro: O nome de usuário é muito curto"
}

func main() {
	leitor := bufio.NewReader(os.Stdin)
	for {
		fmt.Print("Digite um nome de usuário: ")
		nome, _ := leitor.ReadString('\n')
		nome = strings.TrimSpace(nome)
		valido, mensagem := ValidarUsuario(nome)
		fmt.Println(mensagem)
		if valido {
			break
		}
	}
}
