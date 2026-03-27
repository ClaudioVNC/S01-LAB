package main

import (
	"fmt"
)

func podeFormarTriangulo(a, b, c int) bool {
	return a+b > c && a+c > b && b+c > a
}

func classificarTriangulo(a, b, c int) string {
	switch {
	case a == b && b == c:
		return "Equilátero (3 lados iguais)"
	case a == b || a == c || b == c:
		return "Isósceles (2 lados iguais)"
	default:
		return "Escaleno (todos diferentes)"
	}
}

func main() {
	var a, b, c int
	fmt.Print("Digite o primeiro lado: ")
	fmt.Scan(&a)
	fmt.Print("Digite o segundo lado: ")
	fmt.Scan(&b)
	fmt.Print("Digite o terceiro lado: ")
	fmt.Scan(&c)

	if podeFormarTriangulo(a, b, c) {
		fmt.Println("Tipo de triângulo:", classificarTriangulo(a, b, c))
	} else {
		fmt.Println("Erro: Os valores não formam um triângulo válido.")
	}
}
