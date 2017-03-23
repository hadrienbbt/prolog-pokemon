h :- aller(h).
b :- aller(b).
g :- aller(g).
d :- aller(d).

chemin(Y,h,X) :- chemin(X,b,Y).
chemin(Y,d,X) :- chemin(X,g,Y).

chenal(X,h,Y) :- chenal(Y,b,X).
chenal(X,d,Y) :- chenal(Y,g,X).

piste_cyclable(X,h,Y) :- piste_cyclable(Y,b,X).
piste_cyclable(X,d,Y) :- piste_cyclable(Y,g,X).

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