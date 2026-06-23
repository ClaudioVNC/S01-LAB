
alimenta(sol,          vitoria_regia).
alimenta(sol,          alga_verde).
alimenta(sol,          aguape).
alimenta(sol,          samambaia).
alimenta(vitoria_regia, capivara).
alimenta(vitoria_regia, arraia).
alimenta(alga_verde,   pirarucu).
alimenta(aguape,       capivara).
alimenta(pirarucu,     boto).
alimenta(capivara,     jacare).
alimenta(capivara,     onca).
alimenta(jacare,       onca).
alimenta(arraia,       jacare).

fluxo_energia(A, D) :-
    alimenta(A, D).

fluxo_energia(A, D) :-
    alimenta(A, Z),
    fluxo_energia(Z, D).

:- initialization(main, main).

main :-
    write('=== Fluxo de Energia a partir do Sol ==='), nl,
    findall(D, fluxo_energia(sol, D), Lista),
    sort(Lista, Unicos),
    forall(
        member(D, Unicos),
        (write('Sol -> ... -> '), write(D), nl)
    ).
