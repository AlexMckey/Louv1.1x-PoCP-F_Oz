declare
fun {Counter S}
   local D
	  D = {NewDictionary}
	  fun {StepCount St}
		 case St
		 of H|T then
			if {Dictionary.member D H}
			then {Dictionary.put D H {Dictionary.get D H}+1}
			else {Dictionary.put D H 1}
			end
			{Dictionary.entries D}|{StepCount T}
		 else nil
		 end
	  end
   in
	  thread {StepCount S} end
   end
end

local InS X in X = {Counter InS} InS = a|b|a|c|_ {Delay 2000} {Browse X} end

declare X C
S = a|b|a|c|_
C = {NewCell S}
D = {NewDictionary}
if {Dictionary.member D @C.1} then
   X = {Dictionary.get D @C.1}
   {Dictionary.put D @C.1 X+1}
else
   {Dictionary.put D @C.1 1}
end
{Browse {Dictionary.entries D}}
C := @C.2
if {Dictionary.member D @C.1} then
   X = {Dictionary.get D @C.1}
   {Dictionary.put D @C.1 X+1}
else
   {Dictionary.put D @C.1 1}
end
{Browse {Dictionary.entries D}}
C := @C.2
if {Dictionary.member D @C.1} then
   X = {Dictionary.get D @C.1}
   {Dictionary.put D @C.1 X+1}
else
   {Dictionary.put D @C.1 1}
end
{Browse {Dictionary.entries D}}