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

creuser(_):-
	equipe(X),
	ne_possede_pas(X,sabelette),
	write('Vous ne pouvez pas creuser, il vous faut un pokemon possédant la capacité tunnel'),
	!,nl.
	
creuser(_):-
	write('Vous ne pouvez pas creuser ici'),
	!,nl.
	
position:-
	je_suis_a(Ici),	
	chemin(Ici,d,Droite),
	chemin(Ici,g,Gacuhe),
	chemin(Ici,h,Haut),
	chemin(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve '), write(Bas),nl,
	!.


%mer a droite
position:-
	je_suis_a(Ici),	
	chenal(Ici,d,Droite),
	chemin(Ici,h,Haut),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve un chenal pour rejoindre '), write(Droite),nl,
	write('A votre gauche se trouve rien'),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve rien'),nl,
	!.
	
%mer a gauche
position:-
	je_suis_a(Ici),	
	chenal(Ici,g,Gauche),
	chemin(Ici,d,Droite),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve un chenal pour rejoindre '), write(Gauche)nl,
	write('En haut se trouve rien'),nl,
	write('En bas se trouve rien'),nl,
	!.
	
%montagne en bas
position:-
	je_suis_a(Ici),	
	chemin(Ici,d,Droite),
	chemin(Ici,g,Gauche),
	chemin(Ici,h,Haut),
	montagne(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se dresse une montagne, la '), write(Bas),nl,
	!.
	
%montagne en haut
position:-
	je_suis_a(Ici),	
	chemin(Ici,d,Droite),
	chemin(Ici,g,Gauche),
	montagne(Ici,h,Haut),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	write('En haut se dresse une montagne, la '), write(Haut),nl,
	write('En bas se trouve rien'),nl,
	!.

%rien a droite
position:-
	je_suis_a(Ici),	
	chemin(Ici,g,Gauche),
	chemin(Ici,h,Haut),
	chemin(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve rien'),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve '), write(Bas),nl,
	!.

%rien a gauche	
position:-
	je_suis_a(Ici),	
	chemin(Ici,d,Droite),
	chemin(Ici,h,Haut),
	chemin(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve rien'),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve '), write(Bas),nl,
	!.

%rien a droite et a gauche 
position:-
	route(Ici),
	chemin(Ici,h,Haut),
	chemin(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve rien'),nl,
	write('A votre gauche se trouve rien'),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve '), write(Bas),nl,
	!.