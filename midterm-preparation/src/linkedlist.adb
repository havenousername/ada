with Ada.Text_IO;
use Ada.Text_IO;
with replace_g;

package body LinkedList is 
   procedure add(L: in out ListComponent; E: List_Type) is
      Temp: List_Type_Access;
   begin 
      Temp := new List;
      Temp.Node := E;
      
      if L.Start_Node = null then
         L.Start_Node := Temp;
         L.End_Node := Temp;
      else
         L.End_Node.Next := Temp;
         L.End_Node := Temp;
      end if;
   end add;
   
   procedure add(L: in out ListComponent; E: Return_Arr) is
      
   begin 
      for I in E'Range loop
         add(L, E(I));
      end loop;
      
   end add;
   
   
   procedure traverse(L: ListComponent) is
      Temp: List_Type_Access; -- moves through the list
   begin 
      Temp := L.Start_Node;
      
      if Temp = null then 
         emptyListHandle;
      else
         loop
            action(Temp.Node);
            Temp := Temp.Next;
            if Temp = null then exit; end if;
         end loop;
      end if;
   end traverse;
   
   
   procedure free(L: in out ListComponent) is
   begin
      loop
         exit when L.Start_Node = null;
         L.End_Node := L.Start_Node.Next;
         L.Start_Node := L.End_Node; 
      end loop;
   end free;
   
   function size(L: in ListComponent) return Natural is
      Temp: List_Type_Access;
      Length: Natural := 0; 
   begin
      Temp := L.Start_Node;
      if Temp = null then
         return Length;
      else
         loop
            Length := Length + 1;
            Temp := Temp.Next;
            if Temp = null then exit; end if;
         end loop;
         return Length;
      end if;
   end size;
   
   
   function To_Array(L: in ListComponent) return Return_Arr is 
      Temp: List_Type_Access;
      Arr: Return_Arr(1..size(L)); 
   begin
      Temp := L.Start_Node;
      
      if Temp = null then 
         return Arr;
      else 
         for i in Arr'Range loop
            Arr(I) := Temp.Node;
            Temp := Temp.Next;
         end loop;
         return Arr;
      end if;      
   end To_Array;
   
   
   procedure replace_items(L: in out ListComponent; E: List_Type) is
      Res_Arr: Return_Arr := To_Array(L);
      procedure replace_item is new replace_g(List_Type, Positive, Return_Arr, replace_pattern);
      Temp: List_Type_Access := L.Start_Node;
   begin
      replace_item(Res_Arr, E);
      for I in Res_Arr'Range loop
         if Temp.Node /= Res_Arr(I) then
            Temp.Node := Res_Arr(I);
         end if;
         Temp := Temp.Next;
      end loop;
   end replace_items;
   
   
end LinkedList;
