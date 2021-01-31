r(X1,X2,...,Xn).
s(Y1,Y2,...,Yn).
%cartesian product of r*s
cartesian_prod(X1,X2,...,Xn,Y1,Y2,...,Yn) :- r(X1,X2,X3,...,Xn).
cartesian_prod(X1,X2,...,Xn,Y1,Y2,...,Yn) :- s(Y1,Y2,X3,...,Xn).

%join on column 1 and 2
r_join_s_on_1_and_2(X1,X2,...,Xn,Y1,Y2,...,Yn) :- cartesian_prod(Z1,Z2,X3,...,Xn,Z1,Z2,Y3,...,Yn).
r_minus_s (X1,...,Xn) :- r(X1,...,Xn) \+ s(X1,...,Xn).
