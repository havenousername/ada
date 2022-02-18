with character_bag;
with Ada.Command_Line, Ada.Text_IO;
with for_all;

use Ada.Text_IO;

procedure main_unit is
   type Bag_100 is new character_bag.Bag(100);
   type BagArray is array (Positive  range<>) of Bag_100;
   B_Arr: BagArray(1..Ada.Command_Line.Argument_Count);
   Count_M: Natural := 0;
   
   procedure count_multiplicity(B_Bag: in out Bag_100) is
   begin
      Count_M := Count_M + character_bag.Multiplicity_Count(character_bag.Bag(B_Bag));
   end;
   
   procedure remove_duplicates(B_Bag: in out Bag_100) is
   begin
      character_bag.Remove_Duplicates(character_bag.Bag(B_Bag));
   end;
   
   procedure print_bag_multiplicity(B_Bag: in out Bag_100) is
      sum: Natural := 0;
   begin 
      for I in 1..character_bag.Pointer(character_bag.Bag(B_Bag)) loop
         sum := sum + character_bag.Multiplicity(character_bag.Bag(B_Bag), I);
         -- debugging code
         --Put(Integer'Image(character_bag.Multiplicity(character_bag.Bag(B_Bag), I)) & " ");
         --Put(" Data: ");
         --Put(Character'Image(character_bag.Data(character_bag.Bag(B_Bag), I)) & " ;");
      end loop;
      Put(Natural'Image(sum)  & " ");
   end;
       
   
  
   procedure count_for_all is new for_all(Bag_100, Positive, BagArray, count_multiplicity);
   procedure remove_duplicates_all is new for_all(Bag_100, Positive, BagArray, remove_duplicates);   
   procedure print_all_bags_multiplicity is new for_all(Bag_100, Positive, BagArray, print_bag_multiplicity);
begin
   for I in 1..Ada.Command_Line.Argument_Count loop
      declare
         temp_value: String := Ada.Command_Line.Argument(I);
      begin
         for J in temp_value'Range loop
           character_bag.Add(character_bag.Bag(B_Arr(I)), temp_value(J));
         end loop;
      end;
      
   end loop;
   
   if B_Arr'Length = 0 then
      Put_Line("No command line input was provided");
      return;
   end if;
      
   Put_Line("Counting before remove for " & Natural'Image(B_Arr'Length) & "  bags");
   print_all_bags_multiplicity(B_Arr);
   New_Line;
   remove_duplicates_all(B_Arr);
   Put_Line("Counting after remove for " & Natural'Image(B_Arr'Length) & "  bags");
   print_all_bags_multiplicity(B_Arr);
   New_Line;
   count_for_all(B_Arr);
   Put_Line("The sum for all bags is: " & Natural'Image(Count_M));
end main_unit;
