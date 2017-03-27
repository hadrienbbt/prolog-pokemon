%%% Joueur automatique %%%
%% enchainement des actions à réaliser pour terminer le jeu %%

:- dynamic afficher_equipe/0, capturer/1.

autoplay :-
    capturer(sulfura),
    capturer(bulbizarre),
    afficher_equipe.