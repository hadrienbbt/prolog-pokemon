%% Regles d appartenance pokemon

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
