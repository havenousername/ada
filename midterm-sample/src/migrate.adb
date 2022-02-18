procedure migrate(G: in out Grid; Max: Natural) is
begin
   for I in G'Range(1) loop
      for J in G'Range(2) loop
         if G(I, J) > Max then 
            declare
               Diff: Natural := G(I, J) - Max; 
            begin 
               G(I, J) := G(I, J) - Diff;
               
               -- try north 
               if I > Index'Succ(G'First(1)) and (G(Index'Pred(I), J) + Diff) <= Max then
                   G(Index'Pred(I), J) := G(Index'Pred(I), J) + Diff;
                 -- try sourth
               elsif I < Index'Pred(G'Last(1)) and (G(Index'Succ(I), J) + Diff) <= Max then
                 G(Index'Succ(I), J) := (G(Index'Succ(I), J) + Diff);
               elsif J > Index'Succ(G'First(2)) and (G(I, Index'Pred(J)) + Diff) <= Max then -- try left
                  G(I, Index'Pred(J)) := (G(I, Index'Pred(J)) + Diff);
               elsif J < Index'Pred(G'Last(2)) and (G(I, Index'Succ(J)) + Diff) <= Max then -- try right
                  G(I, Index'Succ(J)) := G(I, Index'Succ(J)) + Diff;
               end if;
            end;
            
         end if;
      end loop;
      
   end loop;
   
end migrate;
