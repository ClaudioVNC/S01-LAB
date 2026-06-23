
categoria(canhao_laser,     combate).
categoria(missiles_foguete, combate).
categoria(torpedo_protao,   combate).
categoria(motor_ion,        propulsao).
categoria(propulsor_warp,   propulsao).
categoria(blindagem_titan,  protecao).
categoria(escudo_defletor,  protecao).
categoria(radar_avancado,   sistemas).

peca_hangar(hangar_alpha,   canhao_laser).
peca_hangar(hangar_alpha,   missiles_foguete).
peca_hangar(hangar_alpha,   blindagem_titan).

peca_hangar(hangar_beta,    canhao_laser).
peca_hangar(hangar_beta,    torpedo_protao).
peca_hangar(hangar_beta,    motor_ion).

peca_hangar(hangar_gamma,   missiles_foguete).
peca_hangar(hangar_gamma,   blindagem_titan).
peca_hangar(hangar_gamma,   radar_avancado).

peca_hangar(hangar_delta,   canhao_laser).
peca_hangar(hangar_delta,   propulsor_warp).
peca_hangar(hangar_delta,   escudo_defletor).

peca_hangar(hangar_epsilon, torpedo_protao).
peca_hangar(hangar_epsilon, missiles_foguete).
peca_hangar(hangar_epsilon, radar_avancado).

hangar_combate(H) :-
    peca_hangar(H, P1),
    categoria(P1, combate),
    peca_hangar(H, P2),
    categoria(P2, combate),
    P1 \= P2.

falta_energia(H) :-
    peca_hangar(H, _),
    \+ (peca_hangar(H, P), categoria(P, propulsao)).

:- initialization(main, main).

main :-
    write('=== Hangares de Combate sem Propulsao ==='), nl,
    findall(H, (hangar_combate(H), falta_energia(H)), Lista),
    sort(Lista, Unicas),
    forall(
        member(H, Unicas),
        (write('Hangar critico: '), write(H), nl)
    ).
