% **************** init ******************

:- dynamic je_suis_a/1, se_trouve_a/2, il_y_a/2, ajouter_sac/2, sac/1, equipe/1, mecanicien/1, dresseur/2, recompenseVictoire/2.
:- retractall(dresseur(_)), retractall(equipe(_)), retractall(sac(_)), retractall(je_suis_a(_)), retractall(se_trouve_a(_)), retractall(il_y_a(_)), retractall(ajouter_sac(_)), retractall(mecanicien(_)), retractall(recompenseVictoire(_)).

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

% ***************** joueur automatique et aide **************

:- consult('autoplay.pl').
:- consult('mode_emploi.pl').

:- demarrer.