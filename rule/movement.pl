h :- aller(h).
b :- aller(b).
g :- aller(g).
d :- aller(d).

% aller/1

aller(Direction) :-
    je_suis_a(Ici),
    chemin(Ici, Direction, Labas),
    retract(je_suis_a(Ici)),
    assert(je_suis_a(Labas)),
    decrire(Labas),
    !.

aller(_) :-
    write('Vous ne pouvez pas aller dans cette direction.').

voler(Ville) :-
	possede(roucoups),
	je_suis_a(Ici),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Ville)),
	decrire(Ville),
	!.

voler(_):-
	write("Vous ne pouvez pas utiliser vol"), nl.

surfer(Direction) :-
	possede(lokhlass),
	je_suis_a(Ici),
	chenal(Ici,Direction,Labas),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Labas)),
	decrire(Labas),
	!.

surfer(_):-
	write("Vous ne pouvez pas surfer ici").