
alimentado_por(vitoria_regia,  sol).
alimentado_por(vitoria_regia,  terra).
alimentado_por(vitoria_regia,  agua).
alimentado_por(aguape,         sol).
alimentado_por(aguape,         agua).
alimentado_por(samambaia,      sol).
alimentado_por(samambaia,      terra).
alimentado_por(alga_verde,     sol).
alimentado_por(alga_verde,     terra).
alimentado_por(alga_verde,     agua).
alimentado_por(taboa,          sol).
alimentado_por(taboa,          terra).
alimentado_por(musgo,          sol).
alimentado_por(musgo,          agua).

competidores_diretos(A, B) :-
    alimentado_por(A, sol),
    alimentado_por(A, terra),
    alimentado_por(B, sol),
    alimentado_por(B, terra),
    A \= B.

:- initialization(main, main).

main :-
    write('=== Competidores Diretos (Sol + Terra) ==='), nl,
    findall(A-B, competidores_diretos(A, B), Lista),
    sort(Lista, Unicas),
    forall(
        member(A-B, Unicas),
        (write(A), write(' <-> '), write(B), nl)
    ).
