package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	}
	return false
}

func main() {
	leitor := bufio.NewReader(os.Stdin)
	for {
		fmt.Print("Digite o nome de usuário: ")
		usuario, _ := leitor.ReadString('\n')
		usuario = strings.TrimSpace(usuario)
		fmt.Print("Digite a senha: ")
		senha, _ := leitor.ReadString('\n')
		senha = strings.TrimSpace(senha)

		if verificarLogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
