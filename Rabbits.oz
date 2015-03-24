declare GetRefTime in GetRefTime = {Link ['x-oz://boot/Time']}.1.getReferenceTime
declare
fun {NaiveRabbit N}
  if N == 0 then 2
  elseif N == 1 then 4
  elseif N == 2 then 8
  else {NaiveRabbit N-1}+{NaiveRabbit N-2}+{NaiveRabbit N-3} end
end
fun {Rabbit N}
   local
      fun {RabbitLoop X N1 N2 N3}
	 if X == 0 then N1
	 else
	    {RabbitLoop X-1 N3+N2+N1 N1 N2}
	 end
      end
   in
      case N
      of 0 then 2
      [] 1 then 4
      [] 2 then 8
      else {RabbitLoop N-2 8 4 2}
      end
   end
end
fun {Measure N} %signature to provide
   local T1 T2 T3 T4 NR1 NR2
   in
      T1 = {GetRefTime}
      NR1 = {NaiveRabbit N}
      T2 = {GetRefTime}
      T3 = {GetRefTime}
      NR2 = {Rabbit N}
      T4 = {GetRefTime}
      T2-T1-(T4-T3)
   end
end

{Browse {NaiveRabbit 3}}
{Browse {Rabbit 3}}
{Browse {NaiveRabbit 4}}
{Browse {Rabbit 4}}
{Browse {NaiveRabbit 5}}
{Browse {Rabbit 5}}
{Browse {NaiveRabbit 6}}
{Browse {Rabbit 6}}
{Browse {NaiveRabbit 10}}
{Browse {Rabbit 10}}
{Browse {NaiveRabbit 20}}
{Browse {Rabbit 20}}

{Browse {Measure 10}}
{Browse {Measure 11}}
{Browse {Measure 12}}
{Browse {Measure 13}}
{Browse {Measure 14}}
{Browse {Measure 15}}
{Browse {Measure 16}}
{Browse {Measure 17}}
{Browse {Measure 18}}
{Browse {Measure 19}}
{Browse {Measure 20}}
{Browse {Measure 25}}