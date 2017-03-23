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