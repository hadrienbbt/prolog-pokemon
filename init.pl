je_suis_a(bourgpalette).
sac([]).
equipe([]).
mecanicien([]).

dresseur(ondine,voltorbe).
dresseur(pierre,onyx).
dresseur(teamrocket,miaouss).
dresseur(morgane,alakazam).

recompenseVictoire(ondine,roue).
recompenseVictoire(pierre,chaine).
recompenseVictoire(morgane,pedale).
recompenseVictoire(teamrocket,baie).

estChampion(ondine,lavanville).
estChampion(pierre,argenta).
estChampion(morgane,safrania).
estChampion(teamrocket,celadopole).


demarrer :-
    write("Sacha a battu la ligue Pokemon, ses pokemons sont épuisés alors il décide de les apporter au centre pokemon pour qu’ils puissent se reposer et manger un peu. Il part donc avec sa bicyclette vers le bourg palette pour rendre visite à sa mère pendant que ses pokemons seront entre de bonnes mains."),
    nl, write("Sur le chemin, il roule sur une énorme bosse au sol, perd l’équilibre et tombe de son vélo. Il allait très vite et la douleur de sa chute lui fait perdre connaissance."),
    nl, write("À son réveil, il constate avec horreur que tous ses pokemons ont disparu!"),
    nl, write("En plus il a cassé son vélo dans la chute."),
    nl, nl, write("Heureusement, une fillette qui passait par là vient à son secours. Elle n’a pas vu la scène et ne sait pas qui a pris les Pokemons de Sacha. Elle l’aide à retourner au bourg palette avec la bicyclette cassée."),
    nl, nl, write("Arrivé au Bourg-Palette, il retrouve sa mère et le professeur Chen, et leur explique sa mésaventure. Sa mère, défaite, lui prépare son plat préféré pour le réconforter mais Sacha est très en colère, il veut retrouver ses Pokemons. Il décide donc après ce bon repas de partir à la recherche de Pikachu et de ses autres pokemons."),
    nl, nl, write("Voici le mode d'emploi du jeu :"),nl,
    % Afficher mode d emploi
    help,
    write("A l'avenir, pour afficher le mode d'emploi, entrez 'help' dans la fenêtre, et appuyez sur entrée."),nl.

