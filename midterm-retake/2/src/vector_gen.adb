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
   
   
     
end Vector_Gen;
