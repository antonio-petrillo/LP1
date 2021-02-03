append([], L, L).
append([H|T1], L2, [H|T3]) :- append(T1, L2, T3).
member(X, L) :- append(_, [X|_], L).

print_board([]).
print_board([Row|Rest]) :-
    format('~a|~a|~a \n', Row),
    print_board(Rest).

read_move(Player, Move) :-
    format('\nPlayer ~a insert your move [1-9]: ', [Player]),
    get_single_char(Char), put_char(Char), nl,
    Move is Char - 48,
    Move >= 1, Move =< 9.

adversary(x,o).
adversary(o,x).

starting_board([[1,2,3],[4,5,6],[7,8,9]]).

win_state(P,[[P,P,P], _, _]).
win_state(P,[_, [P,P,P], _]).
win_state(P,[_, _, [P,P,P]]).
win_state(P,[[P,_,_], [P,_,_], [P,_,_]]).
win_state(P,[[_,P,_], [_,P,_], [_,P,_]]).
win_state(P,[[_,_,P], [_,_,P], [_,_,P]]).
win_state(P,[[P,_,_], [_,P,_], [_,_,P]]).
win_state(P,[[_,_,P], [_,P,_], [P,_,_]]).

non_final_state(Board) :-
    \+ win_state(_, Board), % controlla che non e' una board di vittoria
    member(Row, Board),     % estrai le righe della board
    member(Cell, Row),      % estrai le celle della riga
    number(Cell).           % controlla se nella cella vi e' un valore numerico

final_state(Board) :- \+ non_final_state(Board).

move(P,N,BoardIn,BoardOut) :-
    \+ final_state(BoardIn),                          % controlla che la partita non sia finita
    append(RowsBefore, [Row|RowsAfter], BoardIn),     % estraggo la riga
    append(CellsBefore, [N|CellsAfter], Row),         % estraggo la casella dalla riga che "contiene la mossa"
    number(N),                                        % non sono sicuro che serva
    append(CellsBefore, [P|CellsAfter], NewRow),      % preparo la nuova riga inserendo la mossa del giocatore
    append(RowsBefore, [NewRow|RowsAfter], BoardOut). % inserico la nuova riga in modo da generare la nuova board

turn(_, _, Board) :-
    final_state(Board),
    \+ win_state(_, Board),
    format('\nThe game ends in a tie.\n').

turn(P, _, Board) :-
    win_state(_,Board),
    member(Adv, [user1, user2]), Adv \= P,
    format('\nThe ~a wins!\n', [Adv]).

turn(Player, Symbol, Board) :-
    read_move(Symbol, Move), move(Symbol, Move, Board, BoardOut), print_board(BoardOut),
    adversary(Symbol, AdversarySymbol),
    member(AdversaryPlayer, [user1, user2]), AdversaryPlayer \= Player,
    turn(AdversaryPlayer, AdversarySymbol, BoardOut).

game_with_2_players :- % con questo predicato posso avviare una partita una volta caricato il file nella WAM (swipl)
    starting_board(Board),
    turn(user1, x, Board).

main :-
    Choice is random(2),
    nt(Choice, [(user1, o), (user2, x)], (First, Symbol)),
    format('\nThe ~a starts \n', [First]),
    starting_board(Board),
    turn(First, Symbol, Board),
    halt.
