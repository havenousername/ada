with Ada.Text_IO;
use Ada.Text_IO;

package body map_package is
   package Int_IO is new Ada.Text_IO.Integer_IO(Integer);
   use Int_IO;
   function size(M: Map) return Natural is
   begin
      return M.Pointer;
   end Size;
   
  function max_size(M: Map) return Length is
   begin
      return M.Key'Length;
   end max_size;
   
   function is_Empty (M: Map) return Boolean is
   begin
      if M.Pointer > 0 then
         return False;
      end if;
        
      return True;
   end Is_Empty;
   

  function does_Key_Exist (M: Map; key: Integer) return Boolean is 
   begin
      for I in 1..M.Pointer loop
         if M.Key(I) = key then 
            return True;
         end if;
      end loop;
      return False;   
   end does_Key_Exist; 
   
   function first_Key(M: Map) return Integer is 
   begin
     if M.Pointer = 0 then
        return -1;
     end if;
      
      return M.Key(1);
   end first_Key;
     
   function last_Key(M: Map) return Integer is 
   begin
      if M.Pointer = 0 then
        return -1;
      end if;
      return M.Key(M.Pointer);
   end last_Key;
   
   function find_Value(M: Map; key: Integer) return Integer is 
   begin
      for I in 1..M.Pointer loop
         if M.Key(I) = key then 
            return M.Value(I);
         end if;
      end loop;
      
      return -1;
   end find_Value;
   
   function count_Value(M: Map; value: Integer) return Integer is 
      Counter: Natural := 0;
   begin
      for I in 1..M.Pointer loop
         if M.Value(I) = value then 
            Counter := Counter + 1;
         end if;
      end loop;
      
      return Counter;
   end count_Value;
   
   procedure insert(M: in out Map; key, value: Integer) is 
      function key_Index(M: Map; key: Integer) return Natural is
      begin
         for I in 1..M.Pointer loop
            if M.Key(I) = key then 
               return I;
            end if;
         end loop;
      
         return 0;
      end key_Index;  
      Index: Natural := key_Index(M, key);
   begin
      if M.Pointer >= max_size(M) then
         return;
      end if;
      -- Fixed issue #1 
      if Index /= 0 then 
         Put_Line("Key: " & Integer'Image(key) & " already has a value inside. Please use insert procedure for overriding it.");
         -- M.Value(Index) := value;  
      else
         M.Pointer := M.Pointer + 1;
         M.Key(M.Pointer) := key;
         M.Value(M.Pointer) := value;
      end if;
   end insert;
   
   procedure replace(M: in out Map; key, value: Integer) is
      function key_Index(M: Map; key: Integer) return Natural is
      begin
         for I in 1..M.Pointer loop
            if M.Key(I) = key then 
               return I;
            end if;
         end loop;
      
         return 0;
      end key_Index; 
      Index: Natural := key_Index(M, key);
   begin
      if Index = 0 then
         Put_Line("Key: " & Integer'Image(key) & " does not exist in map. Please insert it first");
      else
         M.Value(Index) := value;
      end if; 
   end replace;
   
   
   procedure erase(M: in out Map; key: Integer) is 
   begin
      for I in 1..M.Pointer loop
         if M.Key(I) = key then 
            M.Pointer := M.Pointer - 1;
            for J in I..M.Pointer loop
               M.Key(J) := M.Key(J + 1);
               M.Value(J) := M.Value(J + 1);
            end loop;
         end if;
      end loop;
      
   end erase;
     
   procedure remove(M: in out Map; value: Integer; all_occurrences: Boolean:= False) is
      I: Positive;
   begin
      I := 1;
      while I <= M.Pointer loop
         if M.Value(I) = value then
            erase(M, M.Key(I));
            if not all_occurrences then 
               return;
            else 
               I := 1;
            end if;
         else 
            I := I + 1;
         end if;
      end loop;
   end remove;
   
   procedure clear(M: in out Map) is
   begin
     M.Pointer := 0;
   end clear;
   
   procedure print_map(M: in Map) is
   begin
      if M.Pointer = 0 then 
         Put_Line("Map is empty");
         return;
      end if;
      
      for I in 1..M.Pointer loop
         Put("Key: ");
         Put(M.Key(I));
         Put(", ");
         Put("Value: ");
         Put(M.Value(I));
         New_Line;
      end loop;
      
   end print_map;
   
end map_package;
