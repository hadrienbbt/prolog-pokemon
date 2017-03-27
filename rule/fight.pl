% attaquer/1 param : pokemon attaquant

attaquer_avec(Attaquant) :-
    je_suis_a(Endroit),
    estChampion(Dresseur,Endroit),
    dresseur(Dresseur,Defenseur),
    attaquer(Attaquant,Dresseur,Defenseur),
    !.

attaquer_avec(_) :-
    je_suis_a(Endroit),
    se_trouve_a(_,Endroit),
    write("Vous ne pouvez pas attaquer ce pokemon. Essayez plutôt de le capturer !"),
    !,nl.

attaquer_avec(_) :-
    write("Il n'y a pas de pokemon a attraper ici "),
    !,nl.
    
% attaquer/3 arguments : pokemon, personne, pokemon

% Si On est pas au bon endroit
attaquer(_,Dresseur,_) :-
    je_suis_a(Endroit),
    estChampion(Dresseur,UnAutreEndroit),
    Endroit \= UnAutreEndroit,
    write('Vous ne pouvez pas attaquer ce dresseur ici'),
    nl, !.

% Si on attaque pas le bon pokemon
attaquer(_,Dresseur,PokemonDefenseur) :-
   % Vérifier que le pokemon defenseur n'est pas dans l'équipe adverse'
   dresseur(Dresseur,UnAutrePokemon),
   PokemonDefenseur \= UnAutrePokemon,
   write('Vous n\'attaquez pas le bon Pokemon'),
   !, nl.

% Si on ne possede pas le bon pokemon
attaquer(Attaquant,_,_) :-
    equipe(Y),
    ne_possede_pas(Y,Attaquant),
    write('Vous ne possédez pas '),
    write(Attaquant),
    !, nl.

% Attaque réussie et gagnée
attaquer(Attaquant,Dresseur,PokemonDefenseur) :-
    pokemon(Attaquant,NiveauAttaquant),
    pokemon(PokemonDefenseur,NiveauDefenseur),
    NiveauAttaquant > NiveauDefenseur,
    write(Attaquant), write(' a battu '), write(PokemonDefenseur), write(' !'), nl,
    retractall(dresseur(Dresseur,PokemonDefenseur)),
    recompenser(Dresseur),
    !, nl.

% Attaque réussie et perdue
attaquer(Attaquant,_,PokemonDefenseur) :-
    write(PokemonDefenseur), write(' a battu '), write(Attaquant), write(' !'),
    !, nl.

% Si on l a déjà battu
attaquer(_,Dresseur,_) :-
    write('Vous avez déjà battu '), write(Dresseur),
    !, nl.

% Récompenser après combat réussi

recompenser(Champion) :-
 % Donner la récompense
    recompenseVictoire(Champion,Recompense),
    ajouter_sac(Recompense),
    write('Vous avez obtenu : '), write(Recompense), nl,
    retractall(recompenseVictoire(Champion,Recompense)),
    je_suis_a(Endroit),
    decrire(Endroit).