member(X, [X|_]).
member(X, [_|L]) :- member(X,L).

% esercizio 1
% a)
% member(stud(X,m),[stud(mario,m),stud(maria,f),stud(paolo,m)]).
% b,c(stud(X,m),[stud(mario,m),stud(maria,f),stud(paolo,m)]).
%       |
%       |--> unifica Theta := X = mario
%       |--> backtrack member(X,[_,L]) :- member(X,L).
%       |
%  member(stud(X,m),[stud(maria,f),stud(paolo,m)]).
%       |
%       |--> non unifica := non esiste theta tale che stud(X,m) = stud(maria,f).
%       | '-> banalmente non si puo' cambiare 'f' in 'm' con nessun Theta
%       |
%       |--> backtrack member(X,[_,L]) :- member(X,L).
%       |
%  member(stud(X,m),[stud(paolo,m)]).
%       |
%       |--> unifica Theta := paolo
%       |--> backtrack member(X,[_,L]) :- member(X,L).
%       |
%  member(stud(X,m),[]).
%       |
%       |--> non unifica := non esiste Theta t.c. stud(X,m)*Theta = []
%       |--> end := false

% esercizio 2 select
% select_r_2(X1,X2,...,Xn, lista) :- member(X2,lista).

% esercizio 3 reverse
reverse([], Y, Y).
reverse([X|L], Y, Acc) :- reverse(L, Y, [X|Acc]). 
reverse(X,Y) :- reverse(X,Y,[]).

% predicato append
append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).

% prefisso, suffisso e last
prefix(Prefix, List) :- append(Prefix, _, List).
suffix(Suffix, List) :- append(_, Suffix, List).
last(Last,List)      :- append(_, [Last], List).

member2(X,L) :- append(_,[X|_], L).

sublist(Sub,L) :- prefix(Pre,L), suffix(Sub, Pre).
