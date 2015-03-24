declare
class Constant 
   attr const
   meth init(C)
      const := C
   end
   meth evaluate(X)
      X = @const
   end
end
class Variable
   attr val
   meth init(V)
      val := V
   end
   meth set(V)
      val := V
   end
   meth evaluate(X)
      X = @val
   end
end
class Addition
   attr L R
   meth init(X Y)
      L := X
      R := Y
   end
   meth evaluate(X)
      local LV RV in
	 {@L evaluate(LV)}
	 {@R evaluate(RV)}
	 X = LV + RV
      end
   end
end
class Multiplication
   attr L R
   meth init(X Y)
      L := X
      R := Y
   end
   meth evaluate(X)
      local LV RV in
	 {@L evaluate(LV)}
	 {@R evaluate(RV)}
	 X = LV * RV
      end
   end
end
class Subtraction
    attr L R
   meth init(X Y)
      L := X
      R := Y
   end
   meth evaluate(X)
      local LV RV in
	 {@L evaluate(LV)}
	 {@R evaluate(RV)}
	 X = LV - RV
      end
   end
end
class Division
    attr L R
   meth init(X Y)
      L := X
      R := Y
   end
   meth evaluate(X)
      local LV RV in
	 {@L evaluate(LV)}
	 {@R evaluate(RV)}
	 X = LV div RV
      end
   end
end

declare
VarX = {New Variable init(0)}
VarY = {New Variable init(0)}
local
   Result
   C = {New Constant init(6)}
   Expr1 = {New Addition init(VarX VarY)}
   Expr2 = {New Division init(Expr1 C)}
in
   {VarX set(3)}
   {VarY set(4)}
   {Expr2 evaluate(Result)}
   {Browse Result}
end