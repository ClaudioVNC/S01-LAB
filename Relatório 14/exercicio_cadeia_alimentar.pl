% === Cadeia Alimentar do Pantanal - Exercicio 4 ===

% --- Fatos: quem alimenta quem (A alimenta D) ---
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

% Exercicio 4.1a: Caso Base
% fluxo_energia(A, D) e verdadeiro SE A alimenta diretamente D
fluxo_energia(A, D) :-
    alimenta(A, D).

% Exercicio 4.1b: Passo Recursivo
% fluxo_energia(A, D) e verdadeiro SE A alimenta Z e Z tem fluxo para D
fluxo_energia(A, D) :-
    alimenta(A, Z),
    fluxo_energia(Z, D).

% Exercicio 4.2: Query - Para quem o 'Sol' envia energia (direta ou indiretamente)?
:- initialization(main, main).

main :-
    write('=== Fluxo de Energia a partir do Sol ==='), nl,
    findall(D, fluxo_energia(sol, D), Lista),
    sort(Lista, Unicos),
    forall(
        member(D, Unicos),
        (write('Sol -> ... -> '), write(D), nl)
    ).
