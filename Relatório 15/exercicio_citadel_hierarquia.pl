categoria(cristal_eezo,     materiais).
categoria(bobina_magnetica, propulsao).
categoria(chip_ia,          sistemas).
categoria(sensor_omni,      sensores).
categoria(blindagem_ceramo, protecao).
categoria(nucleo_eezo,      energia).
categoria(modulo_escudo,    protecao).
categoria(propulsor_mk7,    propulsao).
categoria(sistema_tactil,   sistemas).

precisa(nucleo_eezo,    cristal_eezo).
precisa(propulsor_mk7,  nucleo_eezo).
precisa(propulsor_mk7,  bobina_magnetica).
precisa(modulo_escudo,  blindagem_ceramo).
precisa(sistema_tactil, chip_ia).

peca_raiz(P) :-
    categoria(P, _),
    \+ precisa(P, _).

peca_final(P) :-
    categoria(P, _),
    \+ precisa(_, P).

:- initialization(main, main).

main :-
    write('=== Pecas Raiz (sem dependencias) ==='), nl,
    findall(P, peca_raiz(P), L1),
    sort(L1, U1),
    forall(member(P, U1), (write('Peca raiz: '), write(P), nl)),
    nl,
    write('=== Pecas Finais (nao requeridas por ninguem) ==='), nl,
    findall(P, peca_final(P), L2),
    sort(L2, U2),
    forall(member(P, U2), (write('Peca final: '), write(P), nl)),
    nl,
    write('=== Pecas Raiz fora da categoria propulsao ==='), nl,
    findall(P, (peca_raiz(P), \+ categoria(P, propulsao)), L3),
    sort(L3, U3),
    forall(member(P, U3), (write('Componente: '), write(P), nl)).
