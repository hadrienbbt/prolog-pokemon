% actions que l on peut effectuer dans le jeu

:- retractall(estKO(_)).

soigner :-
    je_suis_a(Endroit),
    centrepokemon(Endroit),
    write("Vous confiez vos pokemons à l'infirmière Joelle, celle-ci s'occupe de les soigner et vous les rend en pleine forme! Vous pouvez continuer votre aventure."),
    retractall(estKO(_)),
    !.

soigner :-
    estKO(_),
    write("Vous n'êtes pas au bon endroit pour soigner vos pokemons").

soigner :-
    write("Vous n'avez pas de pokemon à soigner").

fouiller :-
	je_suis_a(Endroit),
	Endroit==r2,
	assert(se_trouve_a(salameche,r2)),
	write("Oh Salamèche se cache derrière les buissons ! Que voulez-vous faire ?"),
	!,nl.

fouiller :-
	write('Il n\'y a rien ici'),
	!,nl.

reparer_velo :-
    je_suis_a(Endroit),
    Endroit \= r6,
    write("Le mécanicien qui vous aidera à réparer votre vélo se trouve sur la route 6."),
    nl,!.

reparer_velo :-
	sac(Outils),
	memberchk(roue,Outils),
    memberchk(chaine,Outils),
    memberchk(pedale,Outils),
    donner(roue,mecanicien),
    donner(chaine,mecanicien),
    donner(pedale,mecanicien),
    write("Votre vélo est réparé, vous pouvez désormais emprunter les pistes cyclables !"),
    ajouter_sac(velo),
    nl,!.

reparer_velo :-
    write("Il vous manque un objet, le mécanicien a besoin de :"), nl,
    veut(mecanicien,Outils),
    write(Outils),
    nl.

% donner/2 un objet à une personne

donner(X,Personne):-
	je_suis_a(azuria),
	veut(Personne,X),
	X == baie,
	retirer_sac(X),
	write('Vous avez donné '),
    write(X),
    write(' à '),
    write(Personne),nl,
    write('Lokhlass se sent mieux il revient à vos côtés.'),nl,
    capturer(lokhlass),
    !.

donner(X,Personne) :-
	je_suis_a(r6),
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

%faire evoluer /1
faire_evoluer(Pokemon):-
	Pokemon == chenipan,
	sac(Sac),
	memberchk(pierrefeuille,Sac),
	possede(chenipan),
	subtract(Sac,[pierrefeuille],NouveauSac),
    retract(sac(Sac)),
    assert(sac(NouveauSac)),
	equipe(X),
	subtract(X,[chenipan],Y),
    append([papillusion],Y,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)),
    write('Vous utilisez votre pierrefeuille sur chenipan, celui-ci evolue en papillusion'),nl,
    !.

faire_evoluer(Pokemon):-
	possede(Pokemon),
	sac(Sac),
	memberchk(pierrefeuille,Sac),
	write("La pierre feuille n'a aucun effet sur ce pokemon, elle est efficace sur les pokemons de type Plante et Insecte"),
	!.

faire_evoluer(_):-
	write("Prof Chen : tu ne peux pas faire ca. Il te faut une pierre évolutive efficace sur un pokemon."),nl,
	!.