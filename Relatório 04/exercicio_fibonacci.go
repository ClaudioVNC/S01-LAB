package main

import (
	"fmt"
)

func fibonacci(n int) {
	if n <= 0 {
		fmt.Println("Quantidade inválida.")
		return
	}
	f0, f1 := 0, 1
	for i := 0; i < n; i++ {
		if i == 0 {
			fmt.Print(f0)
		} else if i == 1 {
			fmt.Print(" ", f1)
		} else {
			f2 := f0 + f1
			fmt.Print(" ", f2)
			f0, f1 = f1, f2
		}
	}
	fmt.Println()
}

func main() {
	var n int
	fmt.Print("Quantos números da sequência de Fibonacci você quer? ")
	fmt.Scan(&n)
	fibonacci(n)
}
