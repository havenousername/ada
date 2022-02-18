with Ada.Text_IO;
with decode;
with character_bag;
use Ada.Text_IO;

procedure Main is
   S: String := "Hello World!";
   Ch_Bag: Character_Bag.Bag(100);
   Mark_Five_Bag : character_bag.Bag(100);
   Mark: String := "which mark will I get for the test?";
   Mark_Five: String := "Of course I will get mark 5!";
begin
   -- 1
   decode(S);
   Put_Line(S);

   -- 2
   for I in Mark'Range loop
       character_bag.Add(Ch_Bag, Mark(I));
   end loop;
   Put_Line("Letter e: " & Natural'Image(character_bag.Multiplicity(Ch_Bag, 'e')));
   Put_Line(Natural'Image(character_bag.Multiplicity_Count(Ch_Bag)));


   character_bag.Remove_Duplicates(Ch_Bag);
   Put_Line("Letter e: " & Natural'Image(character_bag.Multiplicity(Ch_Bag, 'e')));

   for I in Mark_Five'Range loop
      character_bag.add(Mark_Five_Bag, Mark_Five(I));
   end loop;
   Put_Line(Natural'Image(character_bag.Multiplicity_Count(Mark_Five_Bag)));
   character_bag.Remove_Duplicates(Mark_Five_Bag);
   Put_Line(Natural'Image(character_bag.Multiplicity_Count(Mark_Five_Bag)));
end Main;
