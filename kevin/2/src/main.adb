with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
   protected Printer is
      procedure Print(str: in String);
   end Printer;

   protected body Printer is
      procedure Print(str: in String) is
      begin
        Put_Line(str);
      end Print;
   end Printer;

   task Door is
      entry open;
      entry close;
   end Door;

   task body Door is
      is_open : Boolean := false;
   begin
      loop
         select when not is_open =>
               accept open do
                  is_open := True;
               end open;
         or
            when is_open =>
               accept close do
                  is_open := False;
               end close;
         or
            terminate;
         end select;
      end loop;
   end Door;


   task Burglar;
   task body Burglar is
   begin
      delay 1.0;
      Door.open;
      Printer.Print("Burglar opened a door");
      delay 3.0;
      Door.close;
      Printer.Print("Burglar closed the door");
   end Burglar;



begin

   null;
end Main;
