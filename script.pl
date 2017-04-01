% **************** init ******************

:- dynamic je_suis_a/1, se_trouve_a/2, il_y_a/2, ajouter_sac/2, sac/1, equipe/1, mecanicien/1, dresseur/2, recompenseVictoire/2.
:- retractall(dresseur(_)), retractall(equipe(_)), retractall(sac(_)), retractall(je_suis_a(_)), retractall(se_trouve_a(_)), retractall(il_y_a(_)), retractall(ajouter_sac(_)), retractall(mecanicien(_)), retractall(recompenseVictoire(_)).



:-write('Vous vous réveillez avec une bosse sur la tête, un peu paniqué vous retrouvez votre vélo en miette à vos côtés, impossible cependant de remettre la main sur vos Pokémons adorés. Une jeune fille bienveillante se propose de vous ramener chez vous au Bourg Palette, vous la suivez un peu ébranlé par votre chute. Une fois arrivé au Bourg Palette, vous racontez vos mésaventures au professeur Chen. Il vous conseille de partir à la recherche de vos pokémons.'),nl.
:- consult('init.pl').

% **************** faits *****************

:- consult('fact/map.pl').
:- consult('fact/pokemon.pl').
:- consult('fact/item.pl').
:- consult('fact/character.pl').
:- consult('fact/description.pl').

% ****************** règles ******************

:- consult('rule/movement.pl').
:- consult('rule/bag.pl').
:- consult('rule/fight.pl').
:- consult('rule/belonging.pl').
:- consult('rule/action.pl').

% ***************** joueur automatique **************

:- consult('autoplay.pl').

:- demarrer.