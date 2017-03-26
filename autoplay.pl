%%% Joueur automatique %%%
%% enchainement des actions à réaliser pour terminer le jeu %%

:- dynamic afficher_equipe/0, capturer/1.

autoplay :-
    assert(capturer(sulfura)),
    assert(capturer(bulbizarre)),
    assert(afficher_equipe).