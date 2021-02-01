der(X,X,1).
der(X^N, X, N*X^N1) :- N1 is N-1.
der(M*X^N, X, N2*X^N1) :- N1 is N-1, N2 is M*N.

der(sen(X), X, cos(X)).
der(cos(X), X, -sen(X)).

der(log(X), X, 1/X).

der(F+G, X, DF + DG) :- der(F,X,DF), der(G,X,DG).
der(F-G, X, DF - DG) :- der(F,X,DF), der(G,X,DG).
der(F*G, X, DF*G + F*DG) :- der(F,X,DF), der(G,X,DG). 
der(F/G, X, (DF*G - F*DG)/G^2) :- der(F,X,DF), der(G,X,DG). 

% esercizi
len([], R) :- R is 0.
len([_|T], R1) :- len(T,R), R1 is R + 1.

fatt(N, R) :- fatt(N, 1, R).
fatt(0, Acc, Acc).
fatt(N, Acc, Res) :- N > 0, N1 is N-1, Acc1 is Acc*N, fatt(N1, Acc1, Res).

sum(L,R) :- sum(L, 0, R).
sum([],Acc,Acc).
sum([H|T], Acc, R) :- Acc1 is Acc+H, sum(T, Acc1, R).

