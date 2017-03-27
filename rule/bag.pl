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

% donner/1 un objet

donner(X,Personne) :-
    veut(Personne,X),
    retirer_sac(X),
    mecanicien(ElemVelo),
    append([X],ElemVelo,NewElemVelo),
    retract(mecanicien(ElemVelo)),
    assert(mecanicien(NewElemVelo)),
    write('Vous avez donné '),
    write(X),
    write(' à '),
    write(Personne),
    !, nl.

donner(_,Personne) :-
    write('Vous ne pouvez pas donner cet objet à '),
    write(Personne),
    nl.

%% Règles pour ramasser un objet

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
   
%% Règles pour utiliser un objet

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

 

