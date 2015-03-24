declare
fun {Producer N}
   local fun {Ints Cur}
			if Cur == N then Cur|nil
			else 
			   %{Delay 1000}
			   Cur|{Ints Cur+1}
			end
		 end
   in
	  {Ints 1}
   end
end
fun {Filter S}
   case S
   of X|T then
	  if X mod 2 \= 0
	  then X|{Filter T}
	  else {Filter T}
	  end
   else nil
   end
end
fun {Consumer_ S}
   local fun {Sum Sm Stream}
			case Stream of nil then Sm
			[] H|T then Sm|{Sum H+Sm T} end
		 end
   in
	  {Sum 0 S}
   end
end
fun {Consumer S}
   local fun {Sum Sm T}
			case T of nil then Sm
			[] H|T then {Sum H+Sm T} end
		 end
   in
	  {Sum 0 S}
   end
end

local S1 S2 S in
   thread S1={Producer 20} end 
   thread S2={Filter S1} end
   thread S = {Consumer S2} end
   {Browse S}
end

local S1 S in
   thread S1={Producer 5} end
   thread S = {Consumer S1} end
   {Browse S1#S}
end