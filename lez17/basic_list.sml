fun head (x::_) = x;

fun tail (_::xs) = xs;

fun len nil = 0
  | len (_::xs) = 1 + len xs;

fun last' (x::nil) = x
  | last' (_::xs) = last' xs;

fun nth (x::_) 0 = x
  | nth (_::xs) n = nth xs (n-1);

fun is_nil nil = true
  | is_nil _ = false;

fun member nil _ = false
  | member (x::xs) y = if x = y then true else member xs y;

fun append (x::nil) y = [x] @ [y]
  | append (x::xs) y = [x] @ append xs y;

fun append_list (x::nil) y = [x] @ y
  | append_list (x::xs)  y = [x] @ append_list xs y;

fun reverse (x::nil) = [x]
  | reverse (x::xs) = reverse xs @ [x];

fun reverse' x =
    let
        fun reverse_helper [] y = y
          | reverse_helper (x::xs) y = reverse_helper xs ([x] @ y)
    in
        reverse_helper x []
    end;

fun take [] n = []
  | take (_::_) 0 = []
  | take (x::_) 1 = [x]
  | take (x::xs) n = [x] @ take xs (n-1);

fun drop [] n = []
  | drop (_::_) 0 = []
  | drop (_::xs) 1 = xs
  | drop (_::xs) n = drop xs (n-1);

fun filter f [] = []
  | filter f (x::xs) = if f x then x :: (filter f xs) else filter f xs;

fun even x = if x mod 2 = 0 then true else false;
fun odd x = (not o even) x;

fun map f [] = []
  | map f (x::xs)=  [f x] @ (map f xs);

fun map' f [] = []
  | map' f (x::xs)=  (f x) :: (map' f xs);

fun sqr x = x*x;

fun reduce f e [] = e
  | reduce f e (x::xs) = f(x, reduce f e xs);

fun int_to_real l = map real l;
fun extract_even l = filter even l;
fun member' l x = reduce (fn (a,b) => if (a = x) orelse b then true else false) false l;

(* correggere slide (lez 17), soluzioni invertite *)
val args2curry = fn f => fn x => fn y => f(x,y);
val curry2args = fn f => fn (x,y) => f x y;

datatype 'a lista = vuota
                 | nodo of ('a * 'a lista);

val l = nodo(1,nodo(2,nodo(3, vuota)));
val s = nodo(#"h", nodo(#"i", nodo(#"!", vuota)));
val f = nodo("ciao", nodo(" ", nodo("mondo", vuota)));

fun conta(vuota) = 0
  | conta (nodo(_, l)) = 1 + conta(l);
