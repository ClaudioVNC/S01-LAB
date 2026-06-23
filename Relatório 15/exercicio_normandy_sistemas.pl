
categoria(nucleo_eezo,        propulsao).
categoria(controlador_vida,   sistemas).
categoria(escudo_cinetico,    protecao).
categoria(propulsor_ftl,      propulsao).
categoria(sensor_navigation,  sistemas).
categoria(modulo_comunicacao, sistemas).
categoria(computador_central, sistemas).
categoria(gerador_auxiliar,   energia).
categoria(bomba_combustivel,  propulsao).
categoria(filtro_ambiental,   sistemas).

consome(nucleo_eezo,        8).
consome(controlador_vida,   6).
consome(escudo_cinetico,    6).
consome(propulsor_ftl,      10).
consome(sensor_navigation,  6).
consome(modulo_comunicacao, 6).
consome(computador_central, 4).
consome(gerador_auxiliar,   3).
consome(bomba_combustivel,  5).
consome(filtro_ambiental,   2).

precisa(propulsor_ftl,      nucleo_eezo).
precisa(escudo_cinetico,    nucleo_eezo).
precisa(controlador_vida,   nucleo_eezo).
precisa(sensor_navigation,  controlador_vida).
precisa(computador_central, controlador_vida).
precisa(modulo_comunicacao, computador_central).
precisa(bomba_combustivel,  propulsor_ftl).

peca_critica(P) :-
    consome(P, E),
    E > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.

:- initialization(main, main).

main :-
    write('=== Pecas Criticas da Normandy SR-2 ==='), nl,
    findall(P, peca_critica(P), Lista),
    sort(Lista, Unicas),
    forall(
        member(P, Unicas),
        (write('Peca critica: '), write(P), nl)
    ),
    nl,
    write('=== Sistemas com 6 MW sem dependentes ==='), nl,
    findall(P,
        (categoria(P, sistemas),
         consome(P, 6),
         \+ precisa(_, P)),
        Lista2),
    sort(Lista2, Unicas2),
    forall(
        member(P, Unicas2),
        (write('Componente autonomo: '), write(P), nl)
    ).
