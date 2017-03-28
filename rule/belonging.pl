%% Regles d appartenance pokemon

:- dynamic se_trouve_a/2, capturer/1, afficher_equipe/0.
:- retractall(se_trouve_a(_)).

capturer(ronflex) :-
    write("Vous lancez la pokeball mais elle rebondit sur son ventre. Cela n'a aucun effet, il faudra essayer autre chose pour le réveiller."),
    !,nl.

capturer(lokhlass):-
	equipe(E),
    append([lokhlass],E,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)),
    !, nl.
    
capturer(X) :-
    je_suis_a(Endroit),
    se_trouve_a(X, Endroit),
    retract(se_trouve_a(X, Endroit)),
    equipe(E),
    append([X],E,NouvelleEquipe),
    retract(equipe(E)),
    assert(equipe(NouvelleEquipe)),
    write(X),write(' a été capturé !'),
    !, nl.

capturer(_) :-
        write('Il n\'y a pas de pokemon à capturer ici.'),
        nl.

% relacher/1 pour un pokemon

relacher(Pokemon) :-
    equipe(Y),
    memberchk(Pokemon,Y),
    subtract(Y,[Pokemon],NouvelleEquipe),
    retract(equipe(Y)),
    assert(equipe(NouvelleEquipe)),
    write('Vous avez relâché : '),
    write(Pokemon),
    !, nl.

relacher(Pokemon) :-
    write('Vous ne possédez pas '),
    write(Pokemon),
    nl.


%echanger/2 pour donner 2 pokemon au vieillard
echanger(PokemonA,PokemonB):-
	equipe(X),
	PokemonA == colossinge,
	PokemonB == papillusion,
	relacher(PokemonA),
	relacher(PokemonB),
    ajouter_sac(masterball),
    write('Vous donnez '),
    write(PokemonA),
    write(' et '),
    write(PokemonB),
    write('. Vous recevez en retour une masterball qui fait apparaître des pokemons légendaires, cette ball ne rate jamais'),
    assert(se_trouve_a(sulfura,r7)),
    !,nl.
    
echanger(PokemonA,PokemonB):-
	equipe(X),
	PokemonA == papillusion,
	PokemonB == colossinge,
	relacher(PokemonA),
	relacher(PokemonB),
    ajouter_sac(masterball),
    write('Vous donnez '),
    write(PokemonA),
    write(' et '),
    write(PokemonB),
    write('. Vous recevez en retour une masterball qui fait apparaître des pokemons légendaires, cette ball ne rate jamais'),
    assert(se_trouve_a(sulfura,r7)),
    !,nl.

echanger(PokemonA,PokemonB):-
	equipe(X),
	memberchk(PokemonA,X),
	memberchk(PokemonB,X),
	write('Le vieillard ne veut pas de ces pokémons'),
	!,nl.

echanger(_,_):-
	write('Vous ne pouvez pas faire cet échange ici.'),
	!,nl.

% possede/1
possede(Pokemon) :-
	equipe(Y),
	memberchk(Pokemon,Y).

ne_possede_pas([],_).

ne_possede_pas([H|Q],Pokemon) :-
	H \= Pokemon,
	ne_possede_pas(Q,Pokemon),
	!.

afficher_equipe :-
    equipe(X),
    afficher_equipe(X).

afficher_equipe([]) :-
    write("Vous n'avez pas de pokemon dans votre équipe."),nl.

afficher_equipe([UnPokemon]) :-
    pokemon(UnPokemon,Niveau),
    write("Vous possédez un "), write(UnPokemon), write(" de niveau "), write(Niveau),
    nl,!.

afficher_equipe([UnPokemon|Reste]) :-
    pokemon(UnPokemon,Niveau),
    write("Vous possédez un "), write(UnPokemon), write(" de niveau "), write(Niveau),
    nl,
    afficher_equipe(Reste).