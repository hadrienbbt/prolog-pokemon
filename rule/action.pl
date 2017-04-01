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

% donner générique ? TODO

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

% donner/1 et donner/2 un objet à une personne

donner(X) :-
	je_suis_a(azuria),
	veut(infirmierejoelle,X),
	X == baie,
	retirer_sac(X),
	write('Vous avez donné '),
    write(X),
    write(' à l\'infirmière Joelle.'),nl,
    write('Lokhlass se sent mieux, il revient à vos côtés. Vous pouvez maintenant utiliser Surf.'),nl,
    equipe(E),
    append([lokhlass],E,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)),
    !.

donner(_) :-
    write("Action impossible actuellement").

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
    retract(equipe(X)),
    assert(equipe(NouvelleEquipe)),
    write('Vous utilisez votre pierrefeuille sur chenipan, celui-ci evolue directement en papillusion'),nl,
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

raisonner(carapuce) :-
    write("Carapuce dit :"),nl,
    write("Je ne veux plus revenir avec toi, j'ai retrouvé mes amis et on s'amuse à semer la pagaille au village. C'est plus marrant."),nl,
    write("Vous avez le choix : "),nl,
    write("Entrez rep_a. pour dire 'Mais Carapuce, tu es un Pokemon tu es fait pour affronter d'autres Pokemons au côtés d'un dresseur comme moi, reviens s'il te plait.'"),nl,
    write("Entrez rep_b. pour dire 'Je t'en prie carapuce, j'ai besoin de toi pour m'aider à retrouver tous mes pokemons, et tu en fais partie je ne veux pas te perdre.'"),nl.

rep_a :- fausse_rep.

rep_b :-
    write("Carapuce dit :"),nl,
    write("Mes amis ne veulent pas me laisser repartir avec toi, je suis leur chef et sans moi ils sont perdus."),nl,
    write("Vous avez le choix : "),nl,
    write("Entrez rep_c. pour dire 'Tes amis ne valent pas une série de victoire et la puissance que tu pourrais acquérir à mes côtés. Il faut que tu viennes avec moi pour accomplir ta destinée de Pokemon'"),nl,
    write("Entrez rep_d. pour dire 'Tes amis comprendront que tu veuilles retrouver tes amis. Il suffit de leur dire que tu ne peux pas les abandonner aux mains de mauvaises personnes.'"),nl.

rep_c :- fausse_rep.

rep_d :-
    write("Carapuce dit : Alors promets moi que tu ne m'abandonneras plus comme tu l'as fait."),nl,
    write("."),nl,
    write("Vous avez le choix : "),nl,
    write("Entrez rep_e. Désolé, promis ça n'arrivera plus'"),nl,
    write("Entrez rep_f. Ce n'est pas ma faute je suis tombé de mon vélo et j'ai perdu connaissance.'"),nl.

rep_e :-
    write("Votre carapuce est convaincu par votre réponse. Il réintègre votre équipe."),nl,
    equipe(E),
    append([carapuce],E,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)).

rep_f :- fausse_rep.

fausse_rep :-
    write("Votre carapuce ne semble pas convaincu par votre réponse. Il part jouer avec ses amis. Vous courrez pour le ratrapper et essayer de le raisonner."),nl,
    raisonner(carapuce).