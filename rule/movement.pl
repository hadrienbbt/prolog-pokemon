:- dynamic chemin/3, montagne/3.
:- retractall(montagne(_,_,_)).

h :- aller(h).
b :- aller(b).
g :- aller(g).
d :- aller(d).

% montagne/3
montagne(bourgpalette,b,r7).

% Reciproque
montagne(X,h,Y) :- montagne(Y,b,X).
montagne(X,d,Y) :- montagne(Y,g,X).

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
	
creuser(Direction):-
	possede(sabelette),
	je_suis_a(Ici),
	montagne(Ici,Direction,Labas),
	write('La route est désormais creusée, vous pouvez circuler librement'),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Labas)),
	retract(montagne(bourgpalette,b,r7)),
	assert(chemin(bourgpalette,b,r7)),
	nl,
	decrire(Labas),
	!.

creuser(Direction):-
	equipe(X),
	ne_possede_pas(X,sabelette),
	write('Vous ne pouvez pas creuser, il vous faut un pokemon possédant la capacité tunnel'),
	!,nl.
	
creuser(_):-
	write('Vous ne pouvez pas creuser ici'),
	!,nl.