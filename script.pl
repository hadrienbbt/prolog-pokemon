% **************** init ******************

:- dynamic je_suis_a/1, se_trouve_a/2, il_y_a/2, ajouter_sac/2, sac/1, equipe/1.
:- retractall(equipe(_)), retractall(sac(_)), retractall(je_suis_a(_)), retractall(se_trouve_a(_)), retractall(il_y_a(_)), retractall(ajouter_sac(_)).

je_suis_a(bourgpalette).
sac([]).
equipe([]).

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

% pokemon/1
pokemon(pikachu).
pokemon(salameche).
pokemon(bulbizarre).
pokemon(carapuce).
pokemon(roucoups).
pokemon(lokhlass).
pokemon(chenipan).
pokemon(colossinge).
pokemon(sabelette).
pokemon(sulfura).
pokemon(chrysacier).
pokemon(papillusion).
pokemon(ronflex).

% evolue/2

evolue(chenipan,chrysacier).
evolue(chrysacier,papillusion).

% attaque/1

attaque(vol).
attaque(surf).
attaque(tunnel).

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
il_y_a(baie,bourgpalette).
se_trouve_a(sulfura,bourgpalette).

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

% aller/1

aller(Direction) :-
    je_suis_a(Ici),
    chemin(Ici, Direction, Labas),
    retract(je_suis_a(Ici)),
    assert(je_suis_a(Labas)),
    !.

aller(_) :-
    write('Vous ne pouvez pas aller dans cette direction.').

% regles sac

ajouter_sac(Elem) :-
    sac(Y),
    append([Elem],Y,NouveauSac),
    retract(sac(Y)),
    assert(sac(NouveauSac)).

% Règles pour ramasser un objet

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

% regles pokemon

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