with tools;
with Ada.Text_IO;

use Ada.Text_IO;

procedure Main is
   package Integer_Rand is new tools.Random_Generator(Integer);
begin
   null;
   --  Insert code here.
   Put_Line(Integer'Image(Integer_Rand.GetRandom));
end Main;
