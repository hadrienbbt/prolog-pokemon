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

vol(Ville) :-
	possede(roucoups),
	je_suis_a(Ici),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Ville)),
	decrire(Ville),
	!.

vol(_):-
	write("Vous ne pouvez pas utiliser vol"), nl.

surf :-
    je_suis_a(Ici),
    chenal(Ici,Direction,_),
    surfer(Direction).

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

tunnel :-
	je_suis_a(Ici),
    montagne(Ici,Direction,_),
    creuser(Direction),!.

tunnel :- write('Vous ne pouvez pas creuser ici'), nl.

creuser(Direction):-
	possede(sabelette),
	je_suis_a(Ici),
	montagne(Ici,Direction,Labas),
	write('La route est désormais creusée, vous pouvez circuler librement.'),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Labas)),
	write("Vous vous trouvez actuellement à "),write(Labas),write('.'),nl,
	retract(montagne(bourgpalette,b,r7)),
	retract(montagne(r7,b,safrania)),
    write("montagne out"),nl,
	assert(chemin(bourgpalette,b,r7)),
	assert(chemin(r7,b,safrania)),
    write("chemin in"),
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


	
rouler(Direction):-
	sac(Sac),
	memberchk(velo,Sac),
	je_suis_a(Ici),
	piste_cyclable(Ici,Direction,Labas),
	retract(je_suis_a(Ici)),
	assert(je_suis_a(Labas)),
	nl,
	decrire(Labas),
	!.

rouler(Direction):-
	je_suis_a(Ici),
	piste_cyclable(Ici,Direction,_),
	write('Vous n\'avez pas réparé votre vélo'),nl,
	!.

rouler(_):-
	write('Vous ne pouvez pas rouler ici'),
	!.

p :- position.
		
position:-
	je_suis_a(Ici),
	route(Ici),
	chemin(Ici,d,Droite),
	chemin(Ici,g,Gauche),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	!.

position:-
	je_suis_a(Ici),
	route(Ici),
	chemin(Ici,b,Bas),
	chemin(Ici,h,Haut),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('En bas se trouve '), write(Bas),nl,
	write('En haut se trouve '), write(Haut),nl,
	!.

%mer
position:-
	je_suis_a(Ici),
	route(Ici),	
	chenal(Ici,g,Gauche),
	chemin(Ici,d,Droite),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve un chenal pour rejoindre '), write(Gauche),nl,
	!.

position:-
	je_suis_a(Ici),
	ville(Ici),	
	chenal(Ici,d,Droite),
	chemin(Ici,h,Haut),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve un chenal pour rejoindre '), write(Droite),nl,
	write('En haut se trouve '), write(Haut),nl,
	!.

%piste cyclable
position:-
	je_suis_a(r11),
	write('Vous êtes sur une piste cyclable'),nl,
	write('La voie de gauche mène à Celadopole'),nl,
	write('La voie de droite mène à un volcan'),nl,
	!.

position:-
	je_suis_a(celadopole),
	write('Vous êtes à Celadopole'),nl,
	write('La voie du haut mène à r4'),nl,
	write('La voie de gauche mène à r5'),nl,
	write('La voie de droite mène à la r11 via une piste cyclable'),nl,
	!.

position:-
	je_suis_a(volcan),
	write('Vous êtes sur le volcan'),nl,
	write('La voie de gauche mène à r11 via une piste cyclable'),nl,
	!.

position:-
	je_suis_a(Ici),	
	chemin(Ici,d,Droite),
	chemin(Ici,g,Gauche),
	chemin(Ici,h,Haut),
	chemin(Ici,b,Bas),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('A votre gauche se trouve '), write(Gauche),nl,
	write('En haut se trouve '), write(Haut),nl,
	write('En bas se trouve '), write(Bas),nl,
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
	!.

position:-
	je_suis_a(Ici),
	ville(Ici),
	chemin(Ici,b,Bas),
	chemin(Ici,d,Droite),
	write('Vous vous trouvez a '), write(Ici),nl,
	write('A votre droite se trouve '), write(Droite),nl,
	write('En bas se trouve '), write(Bas),nl,
	!.

position:-
	je_suis_a(lavanville),
	write('Vous vous trouvez a Lavanville'),nl,
	write('A votre gauche se trouve r2'),nl,
	write('En bas se trouve r3'),nl,
	!.

position:-
	je_suis_a(argenta),
	write('Vous vous trouvez a Argenta'),nl,
	write('A votre gauche se trouve r6'),nl,
	write('En bas se trouve r4'),nl,
	write('En haut se trouve r3'),nl,
	!.

seDeplacerAleatoirement(Pokemon) :-
    se_trouve_a(Pokemon,Endroit),
    findall(AutreEndroit,chemin(Endroit,_,AutreEndroit),ListeEndroitsProches),
    length(ListeEndroitsProches,NBChemins),
    Suivant is random(NBChemins),
    nth0(Suivant,ListeEndroitsProches,EndroitSuivant),
    write(EndroitSuivant).

distance(X,Y,1) :-
    chemin(X,_,Y),
    !.

distance(X,Y,2) :-
    chemin(X,_,Z),
    chemin(Z,_,Y),
    !.

distance(X,Y,3) :-
    chemin(X,_,Z),
    chemin(Z,_,W),
    chemin(W,_,Y),
    !.

distance(X,Y,3) :-
    chemin(X,_,Z),
    chemin(Z,_,W),
    chemin(W,_,Y),
    !.

distance(X,Y,4) :-
    chemin(X,_,Z),
    chemin(Z,_,W),
    chemin(W,_,V),
    chemin(V,_,Y),
    !.

distance(_,_,_) :- write("Trop loin"), nl.