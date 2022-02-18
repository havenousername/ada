with Ada.Text_IO;
with vector_generic;
use Ada.Text_IO;


procedure Main is
   type Int_Arr is array(Positive range<>) of Integer;
   function is_even(Input: Integer) return Boolean is
   begin
      return (Input mod 2) = 0;
   end is_even;


   package Count_Even_Integer is new vector_generic(Integer, Positive, Int_Arr, is_even);

   function square(I: in out Integer) return Integer is
   begin
      return I * I;
   end square;

   procedure my_action is new Count_Even_Integer.ForEach(square);

   Int_Ar1: Int_Arr := (1, 2, 3, 4, 5, 6, 6, 5);
   Int_Ar2: Int_Arr := (1, 2, 3, 4);


   function is_vowel(c: Character) return Boolean is
      ch: Character := c;
   begin
      if Character'Pos(ch) < 91 and Character'Pos(ch) > 64 then
         ch := Character'Val(Character'Pos(ch) + 32);
      end if;
      return c = 'a' or c = 'e' or c = 'i' or c = 'o' or c = 'u' or c = 'o';
   end is_vowel;

   package Count_Character is new vector_generic(Character, Positive, String, is_vowel);
   Char_String: String := "Hello world";
   Char_String1: String := "Hello world, dummy";
begin
   --  Put_Line(Integer'Image(Count_Even_Integer.Count_Of_Intersection(Int_Ar1, Int_Ar2)));
   --  Put_Line(Integer'Image(Count_Even_Integer.Count_Of_Union(Int_Ar1, Int_Ar2)));
   --  Put_Line(Integer'Image(Count_Even_Integer.Count_Of_Difference(Int_Ar1, Int_Ar2)));
   --   Put_Line(Integer'Image(Count_Even_Integer.Max_Of_Repetitions(Int_Ar1)));
   Put_Line(Boolean'Image(Count_Even_Integer.Compare(6, 5)));
   Put_Line(Boolean'Image(Int_Ar2 < Int_Ar1));
   my_action(Int_Ar1);
   Put_Line(Integer'Image(Int_Ar1(3)) & " Changed");

   Put_Line(Integer'Image(Count_Character.Count_Of_Intersection(Char_String, Char_String1)));
   Put_Line(Integer'Image(Count_Character.Count_Of_Union(Char_String, Char_String1)));
   Put_Line(Integer'Image(Count_Character.Count_Of_Difference(Char_String, Char_String1)));
end Main;
