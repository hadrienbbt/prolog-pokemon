lister :-
    fait(X),
    write(X),nl,
    fail.

lister.

:- consult('$path')

:- dynamic(fait/1)

assert(fait/1) :- insère dynamiquement un fait
retract(fait/1) :- supprimme un fait
