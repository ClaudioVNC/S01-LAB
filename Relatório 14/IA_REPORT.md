# IA Report — Relatório 14

Registo dos prompts utilizados durante a resolução dos exercícios e o código gerado pela IA em resposta a cada um.

---

## Prompt 1

**Exercício:** 1  
**Prompt enviado:**
> como eu declaro fatos em prolog? quero representar que um animal se alimenta de um determinado recurso, tipo alimentado_por(sucuri, agua)

**Código adicionado pela IA:**

```prolog
alimentado_por(sucuri, agua).
alimentado_por(sucuri, terra).
```

---

## Prompt 2

**Exercício:** 1  
**Prompt enviado:**
> como funciona o operador OU dentro de uma regra? quero que a regra seja verdadeira se uma de duas condições for satisfeita

**Código adicionado pela IA:**

```prolog
especie_chave(Animal) :-
    (alimentado_por(Animal, agua) ; alimentado_por(Animal, terra)),
    (nicho(Animal, rios) ; nicho(Animal, pantano) ; nicho(Animal, profundezas)).
```

---

## Prompt 3

**Exercício:** 1  
**Prompt enviado:**
> como eu faço uma query que retorna todos os resultados de uma vez sem duplicatas? tipo o equivalente ao setof mas mais simples

**Código adicionado pela IA:**

```prolog
findall(Animal, especie_chave(Animal), Lista),
sort(Lista, Unicas),
forall(
    member(Animal, Unicas),
    (write('Especie-chave: '), write(Animal), nl)
).
```

---

## Prompt 4

**Exercício:** 1  
**Prompt enviado:**
> como eu executo código automaticamente ao carregar um arquivo, tipo um main?

**Código adicionado pela IA:**

```prolog
:- initialization(main, main).

main :-
    write('=== Especies-Chave do Pantanal ==='), nl,
    ...
```

---

## Prompt 5

**Exercício:** 2  
**Prompt enviado:**
> como eu verifico se um animal tem pelo menos dois valores diferentes para o mesmo predicado? tipo quero checar se nicho(Animal, X) e nicho(Animal, Y) existem com X diferente de Y

**Código adicionado pela IA:**

```prolog
especie_dominante(Animal) :-
    nicho(Animal, X),
    nicho(Animal, Y),
    X \= Y,
    local_comum(Animal, margens).
```

---

## Prompt 6

**Exercício:** 2  
**Prompt enviado:**
> como eu adiciono um novo tipo de fato ao banco de dados para representar o local mais comum de um animal?

**Código adicionado pela IA:**

```prolog
local_comum(capivara, margens).
local_comum(jacare,   margens).
local_comum(sucuri,   margens).
```

---

## Prompt 7

**Exercício:** 3  
**Prompt enviado:**
> como eu crio uma regra que verifica se dois elementos diferentes satisfazem as mesmas duas condições ao mesmo tempo? quero checar se A e B se alimentam de sol e também de terra

**Código adicionado pela IA:**

```prolog
competidores_diretos(A, B) :-
    alimentado_por(A, sol),
    alimentado_por(A, terra),
    alimentado_por(B, sol),
    alimentado_por(B, terra),
    A \= B.
```

---

## Prompt 8

**Exercício:** 3  
**Prompt enviado:**
> como eu uso findall para coletar pares de resultados? quero guardar A e B juntos numa lista

**Código adicionado pela IA:**

```prolog
findall(A-B, competidores_diretos(A, B), Lista),
sort(Lista, Unicas),
forall(
    member(A-B, Unicas),
    (write(A), write(' <-> '), write(B), nl)
).
```

---

## Prompt 9

**Exercício:** 4  
**Prompt enviado:**
> como funciona recursão? quero criar uma regra que seja verdadeira se existe uma cadeia de relações entre dois elementos, não só uma ligação direta

**Código adicionado pela IA:**

```prolog
% Caso base
fluxo_energia(A, D) :-
    alimenta(A, D).

% Passo recursivo
fluxo_energia(A, D) :-
    alimenta(A, Z),
    fluxo_energia(Z, D).
```

---

## Prompt 10

**Exercício:** 4  
**Prompt enviado:**
> como eu evito duplicatas ao usar uma regra recursiva com findall?

**Código adicionado pela IA:**

```prolog
findall(D, fluxo_energia(sol, D), Lista),
sort(Lista, Unicos),
forall(
    member(D, Unicos),
    (write('Sol -> ... -> '), write(D), nl)
).
```

---
