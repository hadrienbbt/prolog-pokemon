%% Décrire %%

decrire(bourgpalette):-
	write("L'air frais du Bourg Palette. Vous vous y sentez comme chez vous."),nl.

decrire(r1):-
	write("Vous arrivez sur la route numéro 1, face à vous se dresse un Chenipan sauvage. Que faire ?"),nl.

decrire(jadielle):-
	write("Vous voici à Jadielle, la première ville que vous traversez dans votre aventure.
	Vous cherchez des informations en demandant à tous les habitants s’ils n’ont pas aperçu vos Pokémons.
	Finalement une jeune fille vous conseille de voyager vers l’est sur la route numéro 2."),nl.

decrire(r2):-
	write("Vous arrivez sur la route numéro 2, vous apercevez au nord des buissons derrière lesquels semble surgir une flamme. Prendrez vous le risque de vous y aventurer ?"),nl.

decrire(buisson):-
	write("Pas trop rassuré, vous vous avancez timidement derrière les buissons et… Surprise ! C’est votre Salamèche égaré qui est en train de faire la sieste paisiblement. Vous le réveillez et il vient s’ajouter à vos pokémons."),nl,
	capturer(salameche).

decrire(lavanville):-
    estChampion(Dresseur,lavanville),
    dresseur(Dresseur,Pokemon),
    pokemon(Pokemon,Niveau),
	write("Vous arrivez à Lavanville. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène."),
	write(" Le combat vous opposera à "),write(Dresseur),write(" et son "),write(Pokemon),write(" de niveau "),write(Niveau),
	write(". Que voulez-vous faire ?"),
	!,nl.

decrire(lavanville):-
	write("Vous arrivez à Lavanville."),
	nl.

decrire(r3):-
	write("Vous arrivez sur la route numéro 3, face à vous se dresse un Colossinge sauvage. Que faire ? "),nl.

decrire(argenta):-
    estChampion(Dresseur,argenta),
    dresseur(Dresseur,Pokemon),
    pokemon(Pokemon,Niveau),
	write("Vous arrivez à Argenta. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène."),
	write(" Le combat vous opposera à "),write(Dresseur),write(" et son "),write(Pokemon),write(" de niveau "),write(Niveau),
	write(". Que voulez-vous faire ?"),
	!,nl.

decrire(argenta):-
	write("Vous arrivez à Argenta"),
	nl.

decrire(r4):-
	write("Vous arrivez sur la route numéro 4, vous rencontrez un vieillard qui vous tient le discours suivant : « Plus ancien que moi mais toujours endormi, on trouve près d’ici des objets d’une puissance infinie »"),nl.

decrire(celadopole):-
	estChampion(Dresseur,celadopole),
    dresseur(Dresseur,Pokemon),
    pokemon(Pokemon,Niveau),
	write("Vous arrivez à Celadopole. Pour aller plus loin vous devez triompher de la team Rocket."),
	write(" Le combat vous opposera à "),write(Dresseur),write(" et son "),write(Pokemon),write(" de niveau "),write(Niveau),
	write(". Que voulez-vous faire ?"),
	!,nl.
	
decrire(celadopole):-
	se_trouve_a(bulbizarre,celadopole),
	write("Vous apercevez Bulbizarre qui s'est échappé des griffes de la team Rocket. Il faudrait le capturer. Que faire ?"),
	nl.

decrire(r5):-
	write("Vous arrivez sur la route numéro 3, face à vous se dresse un Sabelette sauvage. Que faire ? "),nl.

decrire(safrania):-
    estChampion(Dresseur,safrania),
    dresseur(Dresseur,Pokemon),
    pokemon(Pokemon,Niveau),
	write("Vous arrivez à Safrania. Pour aller plus loin vous devez remporter le badge de la ville, pour cela il vous faut triompher de l’arène."),
	write(" Le combat vous opposera à "),write(Dresseur),write(" et son "),write(Pokemon),write(" de niveau "),write(Niveau),
	write(". Que voulez-vous faire ?"),
	!,nl.

decrire(safrania):-
	write("Vous arrivez à Safrania"),
	nl.
decrire(r6):-
	write("Vous arrivez sur la route numéro 6, un mécano se trouve ici, il dit s’y connaitre en réparation de vélo. Voulez vous lui donner vos pièces de vélo ?"),nl.

decrire(r6):-
	equipe(Y),
	length(Y,Taille),
	Taille ==0,
	write("T'aventurer ici sans le moindre pokemon ca ne va pas la tête, il faut faire demi tour"),nl,
	!.

decrire(r6):-
	write("Le mécano vous salue, rien d'autre à signaler"),nl,
	!.

decrire(r7):-
	sac(Sac),
	memberchk(masterball,Sac),
	write("Vous vous trouvez sous la montagne.Oh soudain vous apercevez un superbe pokémon légendaire, c’est Sulfura!"),nl.

decrire(r7):-
	write("Vous vous trouvez sous la montagne."),nl.

decrire(r8):-
	write("Vous arrivez sur la route numéro 8, un Ronflex endormi bloque le passage. Que faire pour le réveiller ?"),nl.

decrire(azuria):-
	write("Vous arrivez à Azuria. Vous retrouvez votre Lokhlass mais il semble très faible, il a besoin d’être soigné. Il faudrait donner une baie à l'infirmière Joelle"),nl.

decrire(r9):-
	write(" Vous arrivez sur la route numéro 9. Une pierre feuille se trouve sur le bord de la route, elle permet de faire evoluer des pokemons de type plante et insecte"),nl.

decrire(carminsurmer):-
	write("Vous arrivez à Carmin sur Mer. Vous reconnaissez votre Carapuce qui est redevenu chef de gang. Il faut absolument tenter de le raisonner. Vous engagez la discussion."),nl.

decrire(r10):-
	possede(lokhlass),
	write("Vous arrivez sur la route numéro 10, rien à signaler ici"),nl.
	
decrire(r10):-
	write("Vous arrivez sur la route numéro 10, la mer bloque le passage menant à Carmin sur Mer, il faudrait un pokémon qui possède Surf. Vous apercevez sur la plage une pokéflute qui semble avoir été égarée ici. "),nl.

decrire(r10):-
	write("Rien à signaler ici, vous pouveze utiliser Surf pour aller a Carmin sur Mer"),nl.

decrire(r11):-
	se_trouve_a(roucoups,r11),
	write("Vous vous baladez tranquillement à velo sur la piste cyclable, soudain vous apercevez Roucoups qui survole l'endroit"),
	!,nl.
	
decrire(r11):-
	write("Vous vous baladez tranquillement à velo sur la piste cyclable"),nl.

decrire(volcan):-
	sac(Sac),
	memberchk(masterball,Sac),
	write("Le vieillard espère que vous ferez un bon usage de la masterball, et vous conseille de la garder pour la capture d'un pokemon rare"),nl.

decrire(volcan):-
	write("Un vieux sage vous propose d'échanger Colossinge et Papillusion en échange d'une masterball, ball qui ne rate jamais"),nl.

