:- dynamic se_trouve_a/2.
:- retractall(se_trouve_a(_)).

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
pokemon(miaouss,3).

% evolue/2

evolue(chenipan,chrysacier).
evolue(chrysacier,papillusion).

% maitrise/2

maitrise(roucoups,vol).
maitrise(lokhlass,surf).
maitrise(sabelette, tunnel).

% se_trouve_a/2

se_trouve_a(chenipan,r1).
se_trouve_a(colossinge,r3).
se_trouve_a(sabelette,r5).
se_trouve_a(ronflex,r8).
se_trouve_a(sulfura,r7).
se_trouve_a(carapuce,carminsurmer).
se_trouve_a(roucoups,r11).
se_trouve_a(lokhlass,azuria).
se_trouve_a(bulbizarre,celadopole).