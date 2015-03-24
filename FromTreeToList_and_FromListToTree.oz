declare
fun {NumLeaves Tree}
   case Tree
   of btree(_ left:L right:R) then
	  {NumLeaves L} + {NumLeaves R}
   [] leaf then 1
   end
end
fun {IsBalanced Tree}
   local
	  fun {CheckNumLeaves L R}
		 case {NumLeaves L} - {NumLeaves R}
		 of 0 then true
		 [] 1 then true
		 [] ~1 then true
		 else false
		 end
	  end
   in
	  case Tree
	  of btree(_ left:L right:R) then
		 if {CheckNumLeaves L R}
			andthen {IsBalanced L}
			andthen {IsBalanced R}
		 then true
		 else false
		 end
	  [] leaf then true
	  end
   end
end

declare
T = btree(4
		  left:btree(5
					 left:btree(2
								left:leaf
								right:btree(5
											left:leaf
											right:leaf))
					 right:btree(7
								 left:leaf
								 right:leaf))
		  right:btree(8 left:leaf right:leaf))
T1 = btree(42 left:btree(26 left:btree(54 left:leaf right:btree(18 left:leaf right:leaf)) right:leaf) right:btree(37 left:btree(11 left:leaf right:leaf) right:leaf))
T2 = btree(42 left:btree(26 left:btree(54 left:leaf right:btree(18 left:leaf right:leaf)) right:leaf) right:btree(37 left:btree(11 left:leaf right:leaf) right:btree(18 left:leaf right:leaf)))

{Browse T}
{Browse {NumLeaves leaf}}
{Browse {NumLeaves btree(4 left:leaf right: leaf)}}
{Browse {NumLeaves T}}
{Browse {IsBalanced leaf}}
{Browse {IsBalanced btree(4 left:leaf right: leaf)}}
{Browse {IsBalanced T}}
{Browse {IsBalanced btree(4 left:btree(2 left:leaf right:leaf) right: leaf)}}
{Browse T1}
{Browse {IsBalanced T1}}
{Browse T2}
{Browse {IsBalanced T2}}