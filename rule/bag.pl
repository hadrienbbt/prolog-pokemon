:- dynamic chemin/3.

%% Regles sac

% ajouter_sac/1

ajouter_sac(Elem) :-
    sac(Y),
    append([Elem],Y,NouveauSac),
    retract(sac(Y)),
    assert(sac(NouveauSac)).

% retirer_sac/1

retirer_sac(Elem) :-
    sac(Y),
    memberchk(Elem,Y),
    subtract(Y,[Elem],NouveauSac),
    retract(sac(Y)),
    assert(sac(NouveauSac)),
    !.

%% Règles pour ramasser un objet

ram :-
    je_suis_a(Endroit),
    il_y_a(X, Endroit),
    ramasser(X).

ramasser(X) :-
    je_suis_a(Endroit),
    il_y_a(X, Endroit),
    ajouter_sac(X),
    retract(il_y_a(X, Endroit)),
    write('Objet ajouté à votre sac.'),
    !, nl.

ramasser(_) :-
    write('Je ne vois rien ici.'),
    nl.


demander(X):-
	X==pokeball,
	sac(Y),
	memberchk(X,Y),
	je_suis_a(bourgpalette),	
	write('Vous avez deja une pokeball, le professeur Chen vous conseille de l\'utiliser avant de revenir le voir'),
	!,nl.

demander(X):-
	X==pokeball,
	je_suis_a(bourgpalette),	
	ajouter_sac(X),
	write('Le professeur Chen vous donne une pokeball et vous encourage a continuer votre chasse aux pokemons'),
	!,nl.

	
demander(_):-
	je_suis_a(bourgpalette),
	write('Le professeur Chen n\'a pas ca pour vous, vous pouvez en revanche lui demander une pokeball'),
	!,nl.

demander(_):-
	write('Tu ne peux rien demander ici, va voir le prof Chen au Bourg Palette si tu veux une pokeball'),
	!,nl.

%% Règles pour utiliser un objet

pokeflute :-
    utiliser(pokeflute).

utiliser(X):-
		X==pokeflute,
		sac(Y),
		memberchk(X,Y),
		je_suis_a(r8),
		se_trouve_a(ronflex,r8),
		retract(se_trouve_a(ronflex, r8)),
		assert(chemin(r8,g,azuria)),
		write('Vous jouez de la flûte, Ronflex se réveille et s\'enfuit'),
		!,nl.

utiliser(X):-
		X==pokeflute,
		sac(Y),
		memberchk(X,Y),
		write('Vous jouez de la flûte, ca ne sert pas à grand chose ici'),
		!,nl.
		
utiliser(_):-
		write('Prof Chen : Vous ne pouvez pas utliser ca ici'),
		!,nl.

s :- afficher_sac.

afficher_sac :-
    write("Vous possédez :"),nl,
    sac(X),
    afficher_sac(X).

afficher_sac([Item]) :- write(Item), write(" x1"),!,nl.

afficher_sac([]) :- write("Votre sac est vide."),!,nl.

afficher_sac([H|Q]) :-
    write(H), write(" x1"),nl,
    afficher_sac(Q).






 

