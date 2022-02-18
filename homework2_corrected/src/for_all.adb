procedure for_all(V: in out Vector) is
begin
   for I in V'Range loop
      activity(V(I));
   end loop;
end for_all;
