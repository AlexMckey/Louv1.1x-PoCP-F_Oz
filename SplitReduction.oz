declare
X1
X2
proc {Split L L1 L2}
   local proc {SplitLoop L Q1 Q2}
			case L
			of nil then
			   L1 = {Reverse Q1}
			   L2 = {Reverse Q2}
			[] H|nil then {SplitLoop nil H|Q1 Q2}
			[] H1|H2|T then {SplitLoop T H1|Q1 H2|Q2}
			end
		 end
   in
	  {SplitLoop L nil nil}
   end
end
{Split [1] X1 X2}
{Browse X1}
{Browse X2}