with most_frequent;
with Ada.Text_IO;

use Ada.Text_IO;

procedure Main is
   Home: String := "Hello, I am going home";
   function is_valid(C: Character) return Boolean is
   begin
      return C /= ' ';
   end is_valid;

   function string_most_frequent_char is new most_frequent(Character, Positive, String, is_valid);
begin
   Put_Line(Character'Image(string_most_frequent_char(Home)));
end Main;
