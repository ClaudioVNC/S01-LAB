% === Fauna do Pantanal - Base de Conhecimento Prolog ===

% --- Fatos: alimentacao por tipo de recurso ---
alimentado_por(capivara, terra).
alimentado_por(jacare,   agua).
alimentado_por(jacare,   terra).
alimentado_por(boto,     agua).
alimentado_por(pirarucu, agua).
alimentado_por(onca,     terra).
alimentado_por(arara,    terra).
alimentado_por(arraia,   agua).

% Exercicio 1.1: Sucuri e alimentada pela Agua e pela Terra
alimentado_por(sucuri, agua).
alimentado_por(sucuri, terra).

% --- Fatos: nicho ecologico ---
nicho(capivara, pantano).
nicho(jacare,   rios).
nicho(jacare,   pantano).
nicho(boto,     rios).
nicho(pirarucu, rios).
nicho(onca,     floresta).
nicho(arara,    floresta).
nicho(arraia,   profundezas).
nicho(sucuri,   pantano).

% Exercicio 1.2: Regra especie_chave(Animal)
% Verdadeira SE o Animal se alimentar da Agua OU da Terra
% E tiver um nicho associado a 'rios', 'pantano' ou 'profundezas'
especie_chave(Animal) :-
    (alimentado_por(Animal, agua) ; alimentado_por(Animal, terra)),
    (nicho(Animal, rios) ; nicho(Animal, pantano) ; nicho(Animal, profundezas)).

% Exercicio 1.3: Query - Quem sao as especies chave?
:- initialization(main, main).

main :-
    write('=== Especies-Chave do Pantanal ==='), nl,
    findall(Animal, especie_chave(Animal), Lista),
    sort(Lista, Unicas),
    forall(
        member(Animal, Unicas),
        (write('Especie-chave: '), write(Animal), nl)
    ).
