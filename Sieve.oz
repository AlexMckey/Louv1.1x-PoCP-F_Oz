declare
fun {Prod N Max}
   if N == Max then N|nil
   else N|{Prod N+1 Max}
   end
end
fun {Sieve Xs}
   case Xs of nil then nil
   [] X|Xr then Ys in
      thread Ys = {Filter Xr fun {$ Y} Y mod X \= 0 end} end
      X|{Sieve Ys}
   end
end
fun {NotPrime S1 S2}
   case S1#S2
   of (H1|T1)#(H2|T2) then
      if H1 == H2 then
	 {NotPrime T1 T2}
      else
	 H1|{NotPrime T1 S2}
      end
   [] _#nil then
      S1
   else
      nil
   end
end
local S1 S2 S3 in
   S1 = {Prod 2 20}
   S2 = {Sieve S1}
   S3 = {NotPrime {Prod 2 20} S2}
   {Browse S1#S2#S3}
end