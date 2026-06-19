% === Fauna do Pantanal - Exercicio 2 ===

% --- Fatos: nicho ecologico (reutilizados do exercicio 1) ---
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

% --- Fatos: local_comum ---
local_comum(capivara, margens).
local_comum(jacare,   margens).
local_comum(boto,     rios).
local_comum(pirarucu, rios).
local_comum(onca,     floresta).
local_comum(arara,    floresta).
local_comum(arraia,   profundezas).
local_comum(sucuri,   margens).

% Exercicio 2.1: Regra especie_dominante(Animal)
% Verdadeira SE o Animal tiver pelo menos dois nichos distintos no banco de dados
% E seu local_comum for 'margens'
especie_dominante(Animal) :-
    nicho(Animal, X),
    nicho(Animal, Y),
    X \= Y,
    local_comum(Animal, margens).

% Exercicio 2.2: Query - Quem sao as especies dominantes?
:- initialization(main, main).

main :-
    write('=== Especies Dominantes do Pantanal ==='), nl,
    findall(Animal, especie_dominante(Animal), Lista),
    sort(Lista, Unicas),
    forall(
        member(Animal, Unicas),
        (write('Especie dominante: '), write(Animal), nl)
    ).
