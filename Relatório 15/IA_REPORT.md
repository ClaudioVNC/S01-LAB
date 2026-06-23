# IA Report — Relatório 15

Registo dos prompts utilizados durante a resolução dos exercícios e o código gerado pela IA em resposta a cada um.

---

## Prompt 1

**Exercício:** 1  
**Prompt enviado:**
> como eu verifico que dois componentes diferentes precisam do mesmo P? quero usar precisa(P1, P) e precisa(P2, P) garantindo que P1 e P2 sejam distintos

**Código adicionado pela IA:**

```prolog
peca_critica(P) :-
    consome(P, E),
    E > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.
```

---

## Prompt 2

**Exercício:** 1  
**Prompt enviado:**
> como eu nego uma condição em prolog? quero verificar que nenhum componente precisa de P, tipo o NOT do SQL

**Código adicionado pela IA:**

```prolog
\+ precisa(_, P)
```

---

## Prompt 3

**Exercício:** 2  
**Prompt enviado:**
> como eu verifico que um hangar tem pelo menos duas peças diferentes da mesma categoria? tipo duas peças de combate distintas

**Código adicionado pela IA:**

```prolog
hangar_combate(H) :-
    peca_hangar(H, P1),
    categoria(P1, combate),
    peca_hangar(H, P2),
    categoria(P2, combate),
    P1 \= P2.
```

---

## Prompt 4

**Exercício:** 2  
**Prompt enviado:**
> como eu escrevo uma regra verdadeira quando nenhum fato satisfaz uma condição com escopo? quero que falta_energia seja verdadeiro apenas se o hangar não tiver nenhuma peça de propulsao

**Código adicionado pela IA:**

```prolog
falta_energia(H) :-
    peca_hangar(H, _),
    \+ (peca_hangar(H, P), categoria(P, propulsao)).
```

---

## Prompt 5

**Exercício:** 3  
**Prompt enviado:**
> como eu expresso "para todos"? quero verificar que o hangar possui todos os requisitos de um componente, sem usar forall

**Código adicionado pela IA:**

```prolog
\+ (requisito(Componente, R), \+ peca_hangar(Hangar, R))
```

---

## Prompt 6

**Exercício:** 3  
**Prompt enviado:**
> como eu escrevo pode_montar completo combinando a verificação de categoria com o "para todos"?

**Código adicionado pela IA:**

```prolog
pode_montar(Hangar, Componente) :-
    categoria(Componente, _),
    \+ categoria(Componente, fundamental),
    \+ (requisito(Componente, R), \+ peca_hangar(Hangar, R)).
```

---

## Prompt 7

**Exercício:** 4  
**Prompt enviado:**
> como eu identifico componentes que não têm nenhum requisito, ou seja, que podem ser instalados imediatamente?

**Código adicionado pela IA:**

```prolog
peca_raiz(P) :-
    categoria(P, _),
    \+ precisa(P, _).
```

---

## Prompt 8

**Exercício:** 4  
**Prompt enviado:**
> como eu combino peca_raiz com uma exclusão de categoria numa query? quero os componentes raiz que não sejam da categoria propulsao

**Código adicionado pela IA:**

```prolog
findall(P, (peca_raiz(P), \+ categoria(P, propulsao)), L3),
sort(L3, U3),
forall(member(P, U3), (write('Componente: '), write(P), nl)).
```

---
