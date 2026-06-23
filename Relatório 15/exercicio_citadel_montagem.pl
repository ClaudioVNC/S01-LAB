
categoria(ia_navegacao,    sistemas).
categoria(motor_bussard,   propulsao).
categoria(escudo_barreira, fundamental).
categoria(turret_gauss,    combate).

requisito(ia_navegacao,    chip_quannico).
requisito(ia_navegacao,    modulo_ia).
requisito(ia_navegacao,    sensor_espacial).
requisito(motor_bussard,   bobina_eezo).
requisito(motor_bussard,   gerador_ftl).
requisito(escudo_barreira, nucleo_eezo).
requisito(escudo_barreira, campo_efeito).
requisito(turret_gauss,    canhao_gauss).
requisito(turret_gauss,    alimentador_eletrico).

peca_hangar(hangar_beta,  chip_quannico).
peca_hangar(hangar_beta,  modulo_ia).
peca_hangar(hangar_beta,  bobina_eezo).
peca_hangar(hangar_beta,  gerador_ftl).
peca_hangar(hangar_beta,  canhao_gauss).
peca_hangar(hangar_beta,  alimentador_eletrico).

peca_hangar(hangar_gamma, chip_quannico).
peca_hangar(hangar_gamma, modulo_ia).
peca_hangar(hangar_gamma, sensor_espacial).
peca_hangar(hangar_gamma, nucleo_eezo).
peca_hangar(hangar_gamma, campo_efeito).

item_faltante(Hangar, Peca) :-
    requisito(_, Peca),
    \+ peca_hangar(Hangar, Peca).

pode_montar(Hangar, Componente) :-
    categoria(Componente, _),
    \+ categoria(Componente, fundamental),
    \+ (requisito(Componente, R), \+ peca_hangar(Hangar, R)).

:- initialization(main, main).

main :-
    write('=== Query 1: Componentes que hangar_beta pode montar ==='), nl,
    findall(C, pode_montar(hangar_beta, C), Lista),
    sort(Lista, Unicos),
    forall(
        member(C, Unicos),
        (write('Pode montar: '), write(C), nl)
    ),
    nl,
    write('=== Query 2: hangar_gamma pode montar ia_navegacao? ==='), nl,
    (pode_montar(hangar_gamma, ia_navegacao)
        -> write('Sim, hangar_gamma pode montar ia_navegacao.'), nl
        ;  write('Nao, hangar_gamma nao pode montar ia_navegacao.'), nl
    ).
