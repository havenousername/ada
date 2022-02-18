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
            V.Pointer := V.Pointer - 1;
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
   
   
   
   ----- 4
   procedure swap(V1, V2: in out vector) is
     i1: Positive;
     ElemTemp: Elem;
   begin
      for i in Positive'First..V1.Pointer loop
         if (size(V2) > i) then
               ElemTemp := V2.Value(i);
               V2.Value(i) := V1.Value(i);
               V1.Value(i) := ElemTemp;
               i1 := i;
         end if;    
      end loop;
      for i in i1..V1.Pointer loop
         remove(V1, V1.Value(i));
      end loop;
      
   
      for i in i1..V2.Pointer loop
         remove(V2, V2.Value(i));
      end loop;
   end swap;
     
   
   procedure join(V1, V2: in out Vector) is 
      G: Positive := Positive'First;
   begin 
      while size(V1) < V1.Pointer loop 
         insert(V1, V2.Value(G));
         G := G + 1;
      end loop;
   end join;
   
   function compare(V1, V2: Vector) return Boolean is 
   begin 
      if not (size(V1) = size(V2)) then
         return false;
      end if;
      
      for I in Positive'First..V1.Pointer loop
         if not (V1.Value(I) = V2.Value(I)) then 
            return False;
         end if;
         
      end loop;
      
      return True;
   end compare;
   
   procedure clear(V: in out Vector) is
   begin
     V.Pointer := 0;
   end clear;
   
   procedure ForEach(V: in out Vector) is
   begin 
      for I in Positive'First..V.Pointer loop
        V.Value(I) := Action(V.Value(I));
      end loop; 
   end ForEach;
end Vector_Gen;
