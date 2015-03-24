declare
T = tree(key:horse value:cheval
              left:tree(key:dog value:chien
                            left:tree(key:cat value:chat left:leaf right:leaf)
                            right:tree(key:elephant value:elephant left:leaf right:leaf))
              right:tree(key:mouse value:souris
                               left:tree(key:monkey value:singe left:leaf right:leaf)
						 right:tree(key:tiger value:tigre left:leaf right:leaf)))

fun {RemoveSmallest T}
   case T
   of leaf then none
   [] tree(key:X value:V left:T1 right:T2) then
	  case {RemoveSmallest T1}
	  of none then triple(T2 X V)
	  [] triple(Tp Xp Vp) then
		 triple(tree(key:X value:V left:Tp right:T2) Xp Vp)
	  end
   end 
end
fun {Delete K T}
   case T
   of leaf then leaf
   [] tree(key:X value:V left:T1 right:T2) andthen K==X then
	  case {RemoveSmallest T2}
	  of none then T1
	  [] triple(Tp Yp Vp) then
		 tree(key:Yp value:Vp left:T1 right:Tp)
	  end
   [] tree(key:X value:V left:T1 right:T2) andthen K>X then
	  tree(key:X value:V left:T1 right:{Delete K T2})
   [] tree(key:X value:V left:T1 right:T2) andthen K<X then
	  tree(key:X value:V left{Delete K T1} right:T2)
   end
end

declare
T1 = {Delete dog T}
{Browse T1}