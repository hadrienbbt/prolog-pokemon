%% Regles d appartenance pokemon

:- dynamic se_trouve_a/2, capturer/1, afficher_equipe/0.
:- retractall(se_trouve_a(_)).

capturer(X) :-
    je_suis_a(Endroit),
    se_trouve_a(X, Endroit),
    retract(se_trouve_a(X, Endroit)),
    equipe(E),
    append([X],E,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)),
    write('Le pokemon a été capturé !'),
    !, nl.

capturer(_) :-
        write('Il n\'y a pas de pokemon à capturer ici.'),
        nl.

% relacher/1 pour un pokemon

relacher(Pokemon) :-
    equipe(Y),
    memberchk(Pokemon,Y),
    subtract(Y,[Pokemon],NouvelleEquipe),
    retract(equipe(Y)),
    assert(equipe(NouvelleEquipe)),
    write('Vous avez relâché : '),
    write(Pokemon),
    !, nl.

relacher(Pokemon) :-
    write('Vous ne possédez pas '),
    write(Pokemon),
    nl.

% possede/1
possede(Pokemon) :-
	equipe(Y),
	memberchk(Pokemon,Y).

ne_possede_pas([],_).

ne_possede_pas([H|Q],Pokemon) :-
	H \= Pokemon,
	ne_possede_pas(Q,Pokemon),
	!.

afficher_equipe :-
    equipe(X),
    afficher_equipe(X).

afficher_equipe([]) :-
    write("fin").

afficher_equipe([UnPokemon]) :-
    pokemon(UnPokemon,Niveau),
    write("Vous possédez un "), write(UnPokemon), write(" de niveau "), write(Niveau),
    nl,!.

afficher_equipe([UnPokemon|Reste]) :-
    pokemon(UnPokemon,Niveau),
    write("Vous possédez un "), write(UnPokemon), write(" de niveau "), write(Niveau),
    nl,
    afficher_equipe(Reste).