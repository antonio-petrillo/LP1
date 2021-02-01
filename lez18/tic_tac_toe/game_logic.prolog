% utility
append([],L,L).
append([H1|T1], L2, [H3|T3]) :- append(T1, L2, T3).
member(X,L) :- append(_, [x,_], L).
number(N) :- member(N,[1,2,3,4,5,6,7,8,9]).

% creazione della board
start([[1,2,3],[4,5,6],[7,8,9]]).

% x e' l'avversario di o e viceversa (un po' come una doppia implicazione '<==>' in logica)
adversary(x,o).
adversary(o,x).

% condizioni di vittoria
win(P, [[P,P,P], _, _]).
win(P, [_, [P,P,P], _]).
win(P, [_, _, [P,P,P]]).
win(P, [[P,_,_], [P,_,_], [P,_,_]]).
win(P, [[_,P,_], [_,P,_], [_,P,_]]).
win(P, [[_,_,P], [_,_,P], [_,_,P]]).
win(P, [[P,_,_], [_,P,_], [_,_,P]]).
win(P, [[_,_,P], [_,P,_], [P,_,_]]).

% board non piena
% in pratica non deve essere:
%  - una board di vittoria
%  - una board in cui sono ancora presenti numeri
non_final(Board) :-
    \+ win(_,Board),
    member(Row, Board),
    member(Cell, Row),
    number(Cell).

% una board finale e' una NON board non-finale
% in questo caso non vi sono celle con numeri nella board
final(Board) :-
    \+ non_final(Board).

% move(+P, N, +Board1, -Board2)
% P -> player che gioca
% N -> numero della mossa (0<= N <= 9)
% Board1 -> board prima della mossa
% Board2 -> board dopo la mossa
move(P, N, Board1, Board2) :-
    \+ win(_,Board1),
    append(RowsBefore, [Row|RowsAfter], Board1),
    append(CellsBefore, [N|CellsAfter], Row),
    number(N),
    append(CellsBefore, [P|CellsAfter], NewRow),
    append(RowsBefore, [NewRow|RowsAfter], Board2).

% has_win_strat(+P, -M, +Board)
has_win_strat(P, _, Board) :-
    win(P,Board).

has_win_strat(P, Move, Board) :-
    move(P, Move, Board, Board2),
    adversary(P,Adv),
    \+ has_tie_strat(Adv, _, _, Board2).

has_tie_strat(_, _, Board) :-
    final(Board),
    \+ win(_, Board).

has_tie_strat(P, Move, Board) :-
    move(P, Move, Board, Board2),
    adversary(P, Adv),
    \+ has_win_strat(Adv, _, Board2).

print_board([]).
print_board([Row|Rest]) :-
    format('~a|~a|~a \n', Row),
    print_board(Rest).

read_move(Player, Move) :-
    format('\nPlayer ~a insert your move [1-9]: ', [Player]),
    get_single_char(Char), put_char(Char), n1,
    Move is Char - 48,
    Move >= 1, Move =<9.

turn(_, _, Board) :-
    final(Board),
    \+ win(_, Board),
    format('\nThe game ends in a tie.\n').

turn(P, _, Board) :-
    win(_, Board),
    member(Adv,[user,cpu]), Adv \= P,
    format('\nThe ~a wins! \n', [Adv]).

turn(user, P, Board) :-
    read_move(P, M),
    move(P, M, Board, Board2),
    print_board(Board2),
    adversary(P, Adv),
    turn(cpu, Adv, Board2).

turn(cpu, P, Board) :-
    (has_win_strat(P, Move, Board); has_tie_strat(P, Move, Board)),
    format('\ncpu move: ~a \n', [Move]),
    move(P, Move, Board, Board2),
    print_board(Board2),
    adversary(P,Adv),
    turn(user, Adv, Board2).

main :-
    Choice is random(2),
    nth0(Choice,[(user,o), (cpu,x)], (First, Symbol)),
    format('\nThe ~a starts \n', [First]),
    start(Board),
    turn(First, Symbol, Board),
    halt.

go(First,Symbol) :-
    member(First, [user, cpu]),
    start(Board),
    turn(First,Symbol,Board).
