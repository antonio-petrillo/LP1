father(terach, abraham).
father(terach, nachor).
father(terach, haran).
father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).

mother(sarah, isaac).

male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).

female(sarah).
female(milcah).
female(yiscah).

daughter(X,Y) :- father(Y,X), female(X).
daughter(X,Y) :- mother(Y,X), female(X).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

daughter2(X,Y) :- parent(Y,X), female(X).
son(X,Y) :- parent(Y,X), male(X).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

% introduzione delle regole ricorsive
% anche questa e' una sorta di dfs
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

