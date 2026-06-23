
nicho(capivara, pantano).
nicho(capivara, margens).
nicho(jacare,   rios).
nicho(jacare,   pantano).
nicho(jacare,   margens).
nicho(boto,     rios).
nicho(pirarucu, rios).
nicho(onca,     floresta).
nicho(arara,    floresta).
nicho(arraia,   profundezas).
nicho(sucuri,   pantano).
nicho(sucuri,   margens).

local_comum(capivara, margens).
local_comum(jacare,   margens).
local_comum(boto,     rios).
local_comum(pirarucu, rios).
local_comum(onca,     floresta).
local_comum(arara,    floresta).
local_comum(arraia,   profundezas).
local_comum(sucuri,   margens).

especie_dominante(Animal) :-
    nicho(Animal, X),
    nicho(Animal, Y),
    X \= Y,
    local_comum(Animal, margens).

:- initialization(main, main).

main :-
    write('=== Especies Dominantes do Pantanal ==='), nl,
    findall(Animal, especie_dominante(Animal), Lista),
    sort(Lista, Unicas),
    forall(
        member(Animal, Unicas),
        (write('Especie dominante: '), write(Animal), nl)
    ).
