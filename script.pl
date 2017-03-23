% **************** init ******************

:- dynamic je_suis_a/1, se_trouve_a/2, il_y_a/2, ajouter_sac/2, sac/1, equipe/1, mecanicien/1, dresseur/2.
:- retractall(dresseur(_)), retractall(equipe(_)), retractall(sac(_)), retractall(je_suis_a(_)), retractall(se_trouve_a(_)), retractall(il_y_a(_)), retractall(ajouter_sac(_)), retractall(mecanicien(_)).

je_suis_a(bourgpalette).
sac([]).
equipe([]).
mecanicien([]).

dresseur(morgane,alakazam).
estChampion(morgane,bourgpalette).
recompenseVictoire(morgane,pedale).

dresseur(pierre,onyx).
estChampion(pierre,azuria).

% **************** faits *****************
% ville/1

ville(bourgpalette).
ville(jadielle).
ville(lavanville).
ville(argenta).
ville(celadopole).
ville(safrania).
ville(carminsurmer).
ville(azuria).
ville(volcan).

% route/1

route(r1).
route(r2).
route(r3).
route(r4).
route(r5).
route(r6).
route(r7).
route(r8).
route(r9).
route(r10).
route(r11).

% chemin/3

%% relations bas
chemin(r1,b,bourgpalette).
chemin(jadielle,b,r1).
chemin(lavanville,b,r3).
chemin(r3,b,argenta).
chemin(argenta,b,r4).
chemin(r4,b,celadopole).
chemin(r7,b,safrania).
chemin(bourgpalette,b,r7).
chemin(azuria,b,r9).
chemin(r9,b,carminsurmer).

%% relations gauche
chemin(r2,g,jadielle).
chemin(lavanville,g,r2).
chemin(argenta,g,r6).
chemin(celadopole,g,r5).
chemin(r5,g,safrania).
chemin(r6,g,bourgpalette).
chemin(safrania,g,r10).
chemin(bourgpalette,g,r8).
chemin(r8,g,azuria).

% chenal/3
chenal(carminsurmer,d,r10).

% piste_cyclable/3
piste_cyclable(r11,g,celadopole).
piste_cyclable(volcan,g,r11).

%% pokemon/2, nom, niveau

% Pokemons à capturer
pokemon(pikachu,10).
pokemon(salameche,2).
pokemon(bulbizarre,8).
pokemon(carapuce,9).
pokemon(roucoups,5).
pokemon(lokhlass,5).
pokemon(chenipan,1).
pokemon(colossinge,4).
pokemon(sabelette,3).
pokemon(sulfura,100).
pokemon(chrysacier,2).
pokemon(papillusion,3).
pokemon(ronflex,4).

% Pokemons champions d arène
% Safrania
pokemon(alakazam,7).
% Argenta
pokemon(onyx,3).
% Lavanville
pokemon(voltorbe,1).

% Team Rocket
pokemon(miaous,3).

% personne/1
personne(mecanicien).
personne(infirmierejoelle).

% evolue/2

evolue(chenipan,chrysacier).
evolue(chrysacier,papillusion).

% maitrise/2

maitrise(roucoups,vol).
maitrise(lokhlass,surf).
maitrise(sabelette, tunnel).

% se_trouve_a/2

se_trouve_a(salameche,r2).
se_trouve_a(colossinge,r3).
se_trouve_a(sabelette,r5).
se_trouve_a(ronflex,r8).
se_trouve_a(sulfura,r7).
se_trouve_a(carapuce,carminsurmer).
se_trouve_a(roucoups,r11).
se_trouve_a(lokhlass,azuria).
se_trouve_a(bulbizarre,celadopole).

% objet/1

objet(pokeball).
objet(masterball).
objet(pokeflute).
objet(guidon).
objet(pedale).
objet(chaine).
objet(roue).
objet(baie).

% il_y_a/2

il_y_a(pokeflute,r10).
il_y_a(chaine,azuria).
% test :
il_y_a(pedale,bourgpalette).
il_y_a(roue,bourgpalette).
il_y_a(baie,bourgpalette).

se_trouve_a(sulfura,bourgpalette).
se_trouve_a(salameche,bourgpalette).
se_trouve_a(bulbizarre,bourgpalette).

h :- aller(h).
b :- aller(b).
g :- aller(g).
d :- aller(d).

% ****************** regles ******************

chemin(Y,h,X) :- chemin(X,b,Y).
chemin(Y,d,X) :- chemin(X,g,Y).

chenal(X,h,Y) :- chenal(Y,b,X).
chenal(X,d,Y) :- chenal(Y,g,X).

piste_cyclable(X,h,Y) :- piste_cyclable(Y,b,X).
piste_cyclable(X,d,Y) :- piste_cyclable(Y,g,X).

% veut/2 Définir ce qu une personne attend qu on lui donne
veut(infirmierejoelle,baie).
veut(mecanicien,pedale).
veut(mecanicien,roue).
veut(mecanicien,chaine).

% aller/1

aller(Direction) :-
    je_suis_a(Ici),
    chemin(Ici, Direction, Labas),
    retract(je_suis_a(Ici)),
    assert(je_suis_a(Labas)),
    decrire(Labas),
    !.

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

aller(_) :-
    write('Vous ne pouvez pas aller dans cette direction.').

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

donner(X,Personne) :-
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

%% Regles pokemon

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

ne_possede_pas([],Pokemon).

ne_possede_pas([H|Q],Pokemon) :-
	H \= Pokemon,
	ne_possede_pas(Q,Pokemon),
	!.

% attaquer/3 arguments : pokemon, personne, pokemon

% Si On est pas au bon endroit
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
    je_suis_a(Endroit),
    estChampion(Dresseur,UnAutreEndroit),
    Endroit \= UnAutreEndroit,
    write('Vous ne pouvez pas attaquer ce dresseur ici'),
    nl, !.

% Si on attaque pas le bon pokemon
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
   % Vérifier que le pokemon defenseur n'est pas dans l'équipe adverse'
   dresseur(Dresseur,UnAutrePokemon),
   PokemonDefenseur \= UnAutrePokemon,
   write('Vous n\'attaquez pas le bon Pokemon'),
   !, nl.

% Si on ne possede pas le bon pokemon
attaquer(Attaquant,Defenseur,PokemonDefenseur) :-
    equipe(Y),
    ne_possede_pas(Y,Attaquant),
    write('Vous ne possédez pas '),
    write(Attaquant),
    !, nl.

% Attaque réussie et gagnée
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
    dresseur(Dresseur,X),
    pokemon(Attaquant,NiveauAttaquant),
    pokemon(PokemonDefenseur,NiveauDefenseur),
    NiveauAttaquant > NiveauDefenseur,
    write(Attaquant), write(' a battu '), write(PokemonDefenseur), write(' !'),
    retractall(dresseur(Dresseur,PokemonDefenseur)),

    % Donner la récompense
    recompenseVictoire(Dresseur,X),
    write(X),
    recompenser(X),
    write('Vous avez obtenu : '), write(X),
    !, nl.

% Attaque réussie et perdue
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
    dresseur(Dresseur,X),
    write(PokemonDefenseur), write(' a battu '), write(Attaquant), write(' !'),
    !, nl.

% Si on l a déjà battu
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
    write('Vous avez déjà battu '), write(Dresseur),
    !, nl.

% Récompenser après recompense

recompenser(Recomense) :-
    write(Recomense),
    ajouter_sac(Recomense),
    retractall(recompenseVictoire(Dresseur,Recomense)).

%% Décrire %%

decrire(r1):-
	write("Vous arrivez sur la route numéro 1, face à vous se dresse un Chenipan sauvage. Que faire ?"),nl.

decrire(jadielle):-
	write("Vous voici à Jadielle, la première ville que vous traversez dans votre aventure.
	Vous cherchez des informations en demandant à tous les habitants s’ils n’ont pas aperçu vos Pokémons.
	Finalement une jeune fille vous conseille de voyager vers l’est sur la route numéro 2."),nl.

decrire(r2):-
	write("Vous arrivez sur la route numéro 2, vous apercevez au nord des buissons derrière lesquels semble surgir une flamme. Prendrez vous le risque de vous y aventurer ? ."),nl.

decrire(buisson):-
	write("Pas trop rassuré, vous vous avancez timidement derrière les buissons et… Surprise ! C’est votre Salamèche égaré qui est en train de faire la sieste paisiblement. Vous le réveillez et il vient s’ajouter à vos pokémons."),nl,
	capturer(salameche).

decrire(lavanville):-
	write("Vous arrivez à Lavanville. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène. Le combat est lancé !"),nl.

decrire(r3):-
	write("Vous arrivez sur la route numéro 3, face à vous se dresse un Colossinge sauvage. Que faire ? "),nl.

decrire(argenta):-
	write("Vous arrivez à Argenta. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène. Le combat est lancé !"),nl.

decrire(r4):-
	write("Vous arrivez sur la route numéro 4, vous rencontrez un vieillard qui vous tient le discours suivant : « Plus ancien que moi mais toujours endormi, on trouve près d’ici des objets d’une puissance infinie »"),nl.

decrire(celadopole):-
	write("Vous arrivez à Céladopole et stupeur la ville est aux mains de la team Rocket. Vous décidez de les affronter afin de libérer la ville."),nl.

decrire(r5):-
	write("Vous arrivez sur la route numéro 3, face à vous se dresse un Sabelette sauvage. Que faire ? "),nl.

decrire(safrania):-
	write("Vous arrivez à Safrania. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène. Le combat est lancé ! "),nl.

decrire(r6):-
	write("Vous arrivez sur la route numéro 6, un mécano se trouve ici, il dit s’y connaitre en réparation de vélo. Voulez vous lui donner vos pièces de vélo ?"),nl.

decrire(r6):-
	equipe(Y),
	length(Y,Taille),
	Taille ==0,
	write("T'aventurer ici sans le moindre pokemon ca ne va pas la tête, il faut faire demi tour"),nl,
	!.

decrire(r6):-
	write("Le mécano vous salue, rien d'autre à signaler"),nl,
	!.

decrire(r7):-
	write("Apres avoir utilisé tunnel, vous vous trouvez sous la montagne."),nl.

decrire(r7):-
	write("Apres avoir utilisé tunnel, vous vous trouvez sous la montagne.Oh soudain vous apercevez un superbe pokémon légendaire, c’est Sulfura!"),nl.

decrire(r8):-
	write("Vous arrivez sur la route numéro 8, un Ronflex endormi bloque le passage. Que faire pour le réveiller ?"),nl.

decrire(azuria):-
	write("Vous arrivez à Azuria. Vous retrouvez votre Lokhlass mais il semble très faible, il a besoin d’être soigné."),nl.

decrire(r9):-
	write(" Vous arrivez sur la route numéro 9. Ici, des centaines de papillusion vous entoure, on dirait un repère fait pour le bonheur des papillusions. Peut être devriez vous y laisser le votre. "),nl.

decrire(carminsurmer):-
	write("Vous arrivez à Carmin sur Mer. Vous reconnaissez votre Carapuce qui est redevenu chef de gang. Il faut absolument tenter de le raisonner. Vous engagez la discussion."),nl.

decrire(r10):-
	write("Vous arrivez sur la route numéro 10, la mer bloque le passage menant à Carmin sur Mer, il faudrait un pokémon qui possède Surf. Vous apercevez sur la plage une pokéflute qui semble avoir été égarée ici. "),nl.

decrire(r10):-
	write("Rien à signaler ici, vous pouveze utiliser Surf pour aller a Carmin sur Mer"),nl.

decrire(r11):-
	write("Vous vous baladez tranquillement à velo sur la piste cyclable"),nl.

decrire(r11):-
	write("Votre Roucoups survole la piste cyclable, à vous de jouer."),nl.

decrire(r11):-
	possede(roucoups),
	write("Vous vous baladez tranquillement à vélo sur la piste cyclable"),nl.

decrire(volcan):-
	possede(colossinge),
	write("Un vieux sage vous propose d'échanger Colossinge et Sabelette en échange d'une masterball, ball qui ne rate jamais"),nl.

