function Count_Values(G: Grid) return Natural is
   Count_Nests: Natural := 0; 
begin
   for I in G'Range(1) loop
      for J in G'Range(2) loop
         if predicate(G(I, J)) then
            Count_Nests := Count_Nests + 1;
         end if;
      end loop; 
   end loop;
   return Count_Nests;
end count_values;
