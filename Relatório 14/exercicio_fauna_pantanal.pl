
alimentado_por(capivara, terra).
alimentado_por(jacare,   agua).
alimentado_por(jacare,   terra).
alimentado_por(boto,     agua).
alimentado_por(pirarucu, agua).
alimentado_por(onca,     terra).
alimentado_por(arara,    terra).
alimentado_por(arraia,   agua).

alimentado_por(sucuri, agua).
alimentado_por(sucuri, terra).

nicho(capivara, pantano).
nicho(jacare,   rios).
nicho(jacare,   pantano).
nicho(boto,     rios).
nicho(pirarucu, rios).
nicho(onca,     floresta).
nicho(arara,    floresta).
nicho(arraia,   profundezas).
nicho(sucuri,   pantano).

especie_chave(Animal) :-
    (alimentado_por(Animal, agua) ; alimentado_por(Animal, terra)),
    (nicho(Animal, rios) ; nicho(Animal, pantano) ; nicho(Animal, profundezas)).

:- initialization(main, main).

main :-
    write('=== Especies-Chave do Pantanal ==='), nl,
    findall(Animal, especie_chave(Animal), Lista),
    sort(Lista, Unicas),
    forall(
        member(Animal, Unicas),
        (write('Especie-chave: '), write(Animal), nl)
    ).
