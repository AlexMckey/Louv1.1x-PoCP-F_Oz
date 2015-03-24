declare
TS = btree(4 left:btree(2 left:btree(1 left:leaf right:leaf) right:btree(3 left:leaf right:leaf))
	   right:btree(5 left:leaf right:leaf))
fun {Infix Tree}
   case Tree
   of btree(T left:leaf right:leaf) then [T]
   [] btree(T left:leaf right:R) then {Append [T] {Infix R}}
   [] btree(T left:L right:leaf) then {Append {Infix L} [T]}
   [] btree(T left:L right:R) then {Append {Append {Infix L} [T]} {Infix R}}
   else nil
   end
end

{Browse {Infix btree(4 left:leaf right:leaf)}}
{Browse {Infix btree(4 left:btree(3 left:btree(1 left:leaf right:leaf) right:leaf) right:leaf)}}
{Browse {Infix btree(4 left:btree(3 left:btree(1 left:leaf right:leaf) right:btree(2 left:leaf right:leaf)) right:leaf)}}
{Browse {Infix TS}}
{Browse {Infix leaf}}
{Browse nil}

