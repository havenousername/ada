generic
   type Elem is (<>);
package bags is
   type Bag is limited private;
   type B_Natural is private;
   type BArray is array(Elem range<>) of B_Natural;
   
   procedure Add(V: in out Bag; E: in Elem);
   procedure Remove_Duplicates(V: in out Bag);
   
   function Multiplicity(V: in Bag; E: in Elem) return Natural;
   function Multiplicity_Count(V: in Bag) return Natural;
private   
   type B_Natural is new Natural;
   
   type Bag is record 
      Bag: BArray(Elem'First..Elem'Last) := (others => 0);
   end record;   
end bags;
