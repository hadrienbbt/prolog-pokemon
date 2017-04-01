:- dynamic chemin/3, montagne/3.
:- retractall(montagne(_,_,_)).


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

% Reciproque
chemin(Y,h,X) :- chemin(X,b,Y).
chemin(Y,d,X) :- chemin(X,g,Y).

% chenal/3
chenal(carminsurmer,d,r10).

% Reciproque
chenal(X,h,Y) :- chenal(Y,b,X).
chenal(X,g,Y) :- chenal(Y,d,X).

% montagne/3
montagne(bourgpalette,b,r7).
montagne(r7,b,safrania).

% Reciproque
montagne(X,h,Y) :- montagne(Y,b,X).
montagne(X,d,Y) :- montagne(Y,g,X).

% piste_cyclable/3
piste_cyclable(r11,g,celadopole).
piste_cyclable(volcan,g,r11).

% Reciproque
piste_cyclable(X,h,Y) :- piste_cyclable(Y,b,X).
piste_cyclable(X,d,Y) :- piste_cyclable(Y,g,X).

% centre pokemon pour les soigner a bourg palette
centrepokemon(bourgpalette).