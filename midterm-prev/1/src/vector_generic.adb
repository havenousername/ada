package body vector_generic is
   function Exists(V: Vector; E: Elem) return Boolean is 
   begin 
      for I in V'Range loop
         if V(I) = E then 
            return True;
         end if;
      end loop;
      
      return False;
   end Exists;
   
   function Count_Of_Intersection(V1: Vector; V2: Vector) return Natural is 
      Counter: Natural := 0; 
   begin
      for I in V1'Range loop 
         if Exists(V2, V1(I)) and Op(V1(I)) then 
            Counter := Counter + 1;
         end if;       
      end loop;
      return Counter;
   end Count_Of_Intersection;
   
   
   function Count_Of_Union(V1: Vector; V2: Vector) return Natural is
      Counter: Natural := V2'Length;
   begin 
      for I in V2'Range loop 
         if not Op(V2(I)) then 
            Counter := Counter - 1;
         end if;
      end loop;
      
      for I in V1'Range loop
         if not Exists(V2, V1(I)) and Op(V1(I)) then 
            Counter := Counter + 1;
         end if;
      end loop;
      
      return Counter;
   end Count_Of_Union;
   
end vector_generic;
