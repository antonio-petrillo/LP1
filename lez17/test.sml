val a = 10;
val a2 = ~10;

fun fatt x = if x = 0 then 1 else x * fatt (x-1);

fun fatt' x = let
    fun fatt_helper (x, acc) = if x = 0 then acc else fatt_helper (x-1, x*acc)
in
    fatt_helper (x, 1)
end;

fun fatt'' x =
    let
        fun fatt_helper x acc = if x = 0 then acc else fatt_helper (x-1) (x*acc)
    in
        fatt_helper x 1
    end;

fun fatt''' x = case x of 0 => 1
                       | 1  => 1
                       | x => x * fatt''' (x-1);

fun fatt'''' 0 = 1
  | fatt'''' x = x * fatt'''' (x-1);
