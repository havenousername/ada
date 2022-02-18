with for_all;
with Text_IO;
use Text_IO;

package body bags is
   procedure Add(V: in out Bag; E: Elem) is
   begin   
      V.Bag(E) := V.Bag(E) + 1;
   end add;
   
   function Multiplicity(V: in Bag; E: Elem) return Natural is 
   begin
      return Natural(V.Bag(E));
   end Multiplicity;

   procedure Remove_Duplicates(V: in out Bag) is
      procedure set_to_one(Item: in out B_Natural) is
      begin 
         if Item > 1 then
            Item := 1;
         end if;
      end set_to_one;
      
      procedure set_all_to_one is new for_all(B_Natural, Elem, BArray, set_to_one);
   begin
      set_all_to_one(V.Bag);
   end Remove_Duplicates;
   
   function Multiplicity_Count(V: in Bag) return Natural is
      Count: Natural := 0;
   begin 
         for I in V.Bag'Range loop
            Count := Count + Natural(V.Bag(I));
         end loop;
         return Count;
   end Multiplicity_Count;
   
end bags;
