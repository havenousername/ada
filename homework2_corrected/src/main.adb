with Ada.Text_IO;
with decode;
with character_bag;
use Ada.Text_IO;

procedure Main is
   S: String := "Hello World!";
   Ch_Bag: Character_Bag.Bag;
   Mark_Five_Bag : Character_Bag.Bag;
   Mark: String := "which mark will I get for the test?";
   Mark_Five: String := "Of course I will get mark 5!";
begin
   -- 1
   decode(S);
   Put_Line(S);

   -- 2.0: checking that remove duplicates doesnt add redundant multiplicity value (issue #3 from feedback)
   character_bag.Remove_Duplicates(Ch_Bag);

   Put_Line("Removing duplicates on empty bag: " & Natural'Image(character_bag.Multiplicity_Count(Ch_Bag)));

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
   Put_Line("Letter o: " & Natural'Image(character_bag.Multiplicity(Mark_Five_Bag, 'o')));
   character_bag.Remove_Duplicates(Mark_Five_Bag);
   Put_Line("Letter o: " & Natural'Image(character_bag.Multiplicity(Mark_Five_Bag, 'o')));
   Put_Line(Natural'Image(character_bag.Multiplicity_Count(Mark_Five_Bag)));
end Main;
