declare
fun {FromListToTree L}
   local Tree
	  fun {InsVal T V}
		 case T
		 of leaf then btree(V left:leaf right:leaf)
		 [] btree(K left:L right:R) then
			if V < K then btree(K left:{InsVal L V} right:R)
			elseif V > K then btree(K left:L right:{InsVal R V})
			else T
			end
		 end
	  end
	  fun {TravList Lst Tr}
		 case Lst
		 of H|T then
			{TravList T {InsVal Tr H}}
		 [] nil then
			Tr
		 end
	  end
   in
	  Tree = leaf
	  {TravList L Tree}
   end
end

declare
L = [42 26 24 28 52 45]

{Browse {FromListToTree [42 26 24 28 52 45]}}