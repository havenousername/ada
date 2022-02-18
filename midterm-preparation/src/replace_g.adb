procedure replace_g(R_Target: in out RArray; Pattern: Elem) is
begin
   for I in R_Target'Range loop
      if R_Target(I) = Pattern  then 
         replace_pattern(R_Target(I));
      end if;
   end loop;
end replace_g;
