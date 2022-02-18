function Count_Grid(Gr: Grid) return Natural is
   counter: Natural := 0;
begin
   for I in Gr'Range(1) loop
      for J in Gr'Range(2) loop
         counter := counter + Gr(I, J);
      end loop;
   end loop;
   
   return counter;
end Count_Grid;
