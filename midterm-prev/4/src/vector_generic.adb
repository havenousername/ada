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
   
   
   function Count_Of_Difference(V1: Vector; V2: Vector) return Natural is
      Counter: Natural := 0;
   begin 
      for I in V1'Range loop 
         if not Exists(V2, V1(I)) and Op(V1(I)) then 
            Counter := Counter + 1;
         end if;
         
      end loop;
      return Counter;
   end Count_Of_Difference;
   
   
   function Count_Of_Repetitions(V: Vector; E: Elem) return Natural is 
      Counter : Natural := 0;
   begin 
      for I in V'Range loop
         if V(I) = E then 
            Counter := Counter+1;
         end if;
      end loop;
      
      return Counter;
   end Count_Of_Repetitions;
   
   function Max_Of_Repetitions(V: Vector) return Elem is 
      E: Elem;
      Counter: Natural := 0;
   begin 
      for I in V'Range loop 
         if Count_Of_Repetitions(V, V(I)) > Counter and Op(V(I)) then 
            Counter := Count_Of_Repetitions(V, V(I));
            E := V(I);
         end if;
      end loop;
      
      return E;
   end Max_Of_Repetitions;
   
   
   function Compare(A: Elem; B: Elem) return Boolean is
   begin
      return Op(A) and not Op(B);
   end Compare;

   function "<"(V1, V2: Vector) return Boolean is 
      CounterV1: Natural := 0;
      CounterV2: Natural := 0;
   begin 
      for I in V1'Range loop
         if Op(V1(I)) then 
            CounterV1 := CounterV1 +1;
         end if;
      end loop;
   
      for I in V2'Range loop
         if Op(V2(I)) then 
            CounterV2 := CounterV2 + 1;
         end if;
      end loop;
      
      return CounterV1 < CounterV2;
   end "<";
   
   
   
   
end vector_generic;
