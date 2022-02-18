generic
   type Elem is private;
package bags is
   type Bag(Max: Positive) is private;

   type TArray is array(Positive range<>) of Elem;
   type VArray is array(Positive range<>) of Natural; 
   
   procedure Add(V: in out Bag; E: in Elem);
   function Multiplicity(V: in Bag; E: in Elem) return Natural;
   function Multiplicity(V: in Bag; Ind: Positive) return Natural;
   function Data(V: in Bag; Ind: Positive) return Elem;
   function Pointer(V: in Bag) return Natural;
   procedure Remove_Duplicates(V: in out Bag);
   function Multiplicity_Count(V: in Bag) return Natural;
   
   Index_Out_Of_Bounds: exception;
private 
   
   type Bag(Max: Positive) 
   is record 
      Data: TArray(1..Max);
      Multiplicity: VArray(1..Max);
      Pointer: Natural:= 0;
   end record;
end bags;
