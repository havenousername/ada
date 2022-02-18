with for_all;
with Text_IO;
use Text_IO;

package body bags is
   function getElemIndex(V: in Bag; E: Elem) return Integer is
   begin
      for I in 1..V.Pointer loop
         if V.Data(I) = E then 
            return I;
         end if;
      end loop;
      return -1;
   end getElemIndex;
   
   procedure Add(V: in out Bag; E: Elem) is
      ElemInd: Integer := getElemIndex(V, E);
      Ex_Message: String := 
        "Add Failed: Index out of bounds. Expected size less than " & 
        Integer'Image(V.Max)
        & ", Got: " &
        Integer'Image(V.Pointer);
   begin
      if V.Pointer >= V.Max then 
         raise Index_Out_Of_Bounds with Ex_Message;
      end if;
      
      if ElemInd = -1 then
         V.Pointer := V.Pointer + 1;
         V.Data(V.Pointer) := E;
         V.Multiplicity(V.Pointer) := 1;
      else
         V.Multiplicity(ElemInd) := V.Multiplicity(ElemInd) + 1;
      end if;  
   end add;
   
   function Multiplicity(V: in Bag; E: Elem) return Natural is 
      ElemInd: Integer := getElemIndex(V, E);
   begin
      if ElemInd = -1 then
         return 0;
      else
         return V.Multiplicity(ElemInd);
      end if;
      
   end Multiplicity;
   
   function Multiplicity(V: in Bag; Ind: Positive) return Natural is 
      Ex_Message: String := 
        "Multiplicity Failed: Index out of bounds. Expected size less than " & 
        Integer'Image(V.Max)
        & ", Got: " &
        Integer'Image(Ind);
   begin 
      if Ind >= V.Max then
         raise Index_Out_Of_Bounds with Ex_Message;
      end if;
      
      return V.Multiplicity(Ind);
   end Multiplicity;
   
   function Data(V: in Bag; Ind: Positive) return Elem is
   begin 
     return V.Data(Ind);
   end Data;
   
   
   function Pointer(V: in Bag) return Natural is
   begin
      return V.Pointer;
   end;
   
   
   
   procedure Remove_Duplicates(V: in out Bag) is
      procedure set_to_one(Ind: in out Natural) is
      begin 
         Ind := 1;
      end set_to_one;
      
      procedure set_all_to_one is new for_all(Natural, Positive , VArray, set_to_one);
   begin
      set_all_to_one(V.Multiplicity);
   end Remove_Duplicates;
   
   function Multiplicity_Count(V: in Bag) return Natural is
      Count: Natural := 0;
   begin 
         for I in 1..V.Pointer loop
            Count := Count + V.Multiplicity(I);
         end loop;
         return Count;
   end Multiplicity_Count;
   
   
end bags;
