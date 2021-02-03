append([], L, L).
append([H|T1], L, [H|T3]) :- append(T1, L, T3).

member(X, L) :- append(_, [X|_], L).

start([[1,2,3],[4,5,6],[7,8,9]]).

print_board([]).
print_board([Row|Rest]) :-
    format('~a|~a|~a\n', Row),
    print_board(Rest).

read_move(Player, Move) :-
    format('\nPlayer ~a insert your move [1-9]: ', [Player]),
    get_single_char(Char), put_char(Char), nl,
    Move is Char - 48,
    Move >= 1, Move =< 9.

adversary(x,o).
adversary(o,x).

win(Player, [[Player,Player,Player], _, _ ]).
win(Player, [_, [Player,Player,Player], _ ]).
win(Player, [_, _, [Player,Player,Player]]).
win(Player, [[Player, _, _], [Player, _, _], [Player, _, _]]).
win(Player, [[_, Player, _], [_, Player, _], [_, Player, _]]).
win(Player, [[_, _, Player], [_, _, Player], [_, _, Player]]).
win(Player, [[Player, _, _], [_, Player, _], [_, _, Player]]).
win(Player, [[_, _, Player], [_, Player, _], [Player, _, _]]).

non_final(Board) :-
    \+ win(_, Board),
    member(Row, Board),
    member(Cell, Row),
    number(Cell).

final(Board) :- \+ non_final(Board).

% + := IN, - := OUT, nothing := IN/OUT
% move(+Player, Move, +Board, -Board2)
move(Player, Move, BoardIn, BoardOut) :-
    \+ win(_, BoardIn),
    append(RowsBefore, [Row|RowsAfter], BoardIn),
    append(CellsBefore, [Move|CellsAfter], Row),
    number(Move),
    append(CellsBefore, [Player|CellsAfter], NewRow),
    append(RowsBefore, [NewRow|RowsAfter], BoardOut).

has_win_strat(Player, _, Board) :- win(Player, Board).
has_win_strat(Player, Move, Board) :-
    move(Player, Move, Board, BoardOut),
    adversary(Player, Adversary),
    \+ has_tie_strat(Adversary, _, BoardOut).

has_tie_strat(_, _, Board) :-
    final(Board),
    \+ win(_, Board).
has_tie_strat(Player, Move, Board) :-
    move(Player, Move, Board, BoardOut),
    adversary(Player, Adversary),
    \+ has_win_strat(Adversary, _, BoardOut).

turn(_, _, Board) :-
    final(Board),
    \+ win(_, Board),
    format('\nThe game end in a tie.\n').

turn(Player, _, Board) :-
    win(_, Board),
    member(Adversary, [user, cpu]), Adversary \= Player,
    format('\nThe ~a wins!\n', [Adversary]).

% Player rappresenta il simbolo che il giocatore utilizza
turn(user, Player, Board) :-
    read_move(Player, Move),
    move(Player, Move, Board, BoardOut),
    print_board(BoardOut),
    adversary(Player, Adversary),
    turn(cpu, Adversary, BoardOut).

turn(cpu, Player, Board) :-
    (has_win_strat(Player, Move, Board); has_tie_strat(Player, Move, Board)),
    format('\ncpu move: ~a \n', [Move]),
    move(Player, Move, Board, BoardOut),
    print_board(BoardOut),
    adversary(Player, Adversary),
    turn(user, Adversary, BoardOut).

go(First, Symbol) :-
    member(First, [user, cpu]),
    start(Board),
    turn(First, Symbol, Board).

main :-
    Choice is random(2),
    nth0(Choice, [(user,x), (cpu,o)], (First, Symbol)),
    format('\nThe ~a starts.\n', [First]),
    start(Board),
    turn(First, Symbol, Board),
    halt.
    
    
