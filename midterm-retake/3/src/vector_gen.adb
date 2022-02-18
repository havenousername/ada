with Ada.Text_IO;
use Ada.Text_IO;
package body Vector_Gen is 
   procedure insert(V: in out vector; item: Elem) is 
   begin 
      if V.Pointer < V.Max then 
         V.Pointer := V.Pointer + 1;
         V.Value(v.Pointer) := item;
      end if;      
   end insert;
   
   function size(V: in Vector) return Natural is 
   begin 
      return V.Pointer;
   end size;
   
   procedure pop(V: in out Vector) is 
      Stack_Underflow_Exception: Exception;
   begin 
      if V.Pointer = 0 then 
         raise Stack_Underflow_Exception with "Stack Underflow Exception: Vector is empty";
      else 
         V.Pointer := V.Pointer - 1;
      end if;
   end pop;
   
   procedure print_vector(V: in Vector) is 
   begin 
      for I in 1..V.Pointer loop
         Put(Elem'Image(V.Value(I)) & ", ");
      end loop;
      New_Line;
   end print_vector;
   
   function first(V: in Vector) return Elem is 
   begin
      return V.Value(Positive'First);
   end first;
   
   function last(V: in Vector) return Elem is 
   begin
      return V.Value(V.Pointer);
   end last;
   
   
   function Is_Empty(V: in Vector) return Boolean is
   begin
      return V.Pointer = 0;
   end Is_Empty;
   
   
   procedure remove(V: in out Vector; item: Elem) is
      
   begin
      for I in 1..V.Pointer loop
         if V.Value(I) = item then 
            if I /= V.Pointer then 
               V.Pointer := V.Pointer - 1;
            end if;
            
            for J in I..V.Pointer loop
               V.Value(J) := V.Value(J + 1);
            end loop;
         end if;
      end loop;
   end remove;
   
   procedure remove_all(V: in out Vector; item: Elem) is 
       I: Positive := 1;
   begin
      while I <= V.Pointer loop
         if V.Value(I) = item then
            remove(V, item);
         else 
            I := I + 1;
         end if;   
      end loop;
   end remove_all;
   
   
   
end Vector_Gen;
