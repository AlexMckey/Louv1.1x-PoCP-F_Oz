declare
fun {Transform L}
   local R
      fun {AdjointAt X N V}
	 case V
	 of (L|H|T|_)|TL then
	    X.(N.1) = {Transform [L H T]}
	    {AdjointAt X N.2 TL}
	 [] H|T then
	    X.(N.1) = H
	    {AdjointAt X N.2 T}
	 [] nil then
	    X
	 else
	    X
	 end
      end
   in
      case L
      of N|Ns|Vs|_ then
	 R = {Record.make N Ns}
	 R = {AdjointAt R Ns Vs}
	 R
      else
	 R
      end
   end
end
RL = [z [3 a] [b 5]]
RX = [x [5 6 f] [5 f [c [2 3] [b n]]]]
RZ = [x [5 6 f] [5 f RL]]
Z = {Transform RL}
S = {Transform RX}
A = {Transform RZ}
R = {Record.make RL.1 RL.2.1}
R = {AdjointAt R RL.2.1 RL.2.2.1}
   
{Browse R}
{Browse Z}
{Browse S}
{Browse A}