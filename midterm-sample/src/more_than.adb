function More_Than(G: Grid; Max: Natural) return Natural is
   count: Natural := 0;
begin 
   for I in G'Range(1) loop
      for J in G'Range(2) loop
         if G(I, J) > Max then
            return Count;
         end if;
         Count := Count + G(I, J);
      end loop;
   end loop;
   return Count;
end More_Than;
