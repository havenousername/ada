with Ada.Text_IO;
with replace_g;

use Ada.Text_IO;

procedure replace_main is
   test: String := "Hello, my name is Oleg";
   
   procedure replace_to_dot(Ch: in out Character) is
   begin
      Ch := '.';
   end replace_to_dot;
   
   
   procedure replace_string is new replace_g(Character, Positive, String, replace_to_dot);
begin
   replace_string(test, ' ');
   Put_Line(test);
end replace_main;
