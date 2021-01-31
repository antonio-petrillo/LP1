signature STACK  =
sig
    type 'a stack
    val empty : 'a stack
    val push : ('a * 'a stack) -> 'a stack
    val pop : 'a stack -> ('a * 'a stack)
end;


structure Stack :> STACK =
struct
type 'a stack = 'a list
exception Empty of string
val empty = []
fun push (x, s) =  x :: s
fun pop [] = raise Empty "stack vuoto"
  | pop (x::s) = (x, s)
  (*| pop s = (hd s, tl s)*)
end;
