with Ada.Text_IO;
with Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Main is
   package Random_Num is new Ada.Numerics.Discrete_Random(Float); use Random_Num;
   G: Generator;

   protected Safe_Random is
      procedure Generate_Random_Duration(D: out  Duration);
   private
      Gen: Ada.Numerics.Float_Random.Generator;
   end Safe_Random;

   protected body Safe_Random is
      procedure Generate_Random_Duration(D: out Duration) is
      begin
         D : constant Duration := Ada.Numerics.Float_Random.Random(Gen) rem 4;
      end Generate_Random_Duration;
   end Safe_Random;


   protected Printer is
      procedure Print(str: in String);
   end Printer;

   protected body Printer is
      procedure Print(str: in String) is
      begin
        Put_Line(str);
      end Print;
   end Printer;

   task type Trap is
      entry Hit;
   end Trap;

   task body Trap is
      rand: Duration;
   begin
      Safe_Random.Generate_Random_Duration(rand);
      Printer.Print("This trap will wait for " & rand'Image & " time");
      delay rand;
      loop
         select
            accept Hit;
         or
            delay 0.1;
         end  loop;
      end select;
   end Trap;

   type P_Trap is access Trap;
   Dynamic_Trap: P_Trap;

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
                  Dynamic_Trap = new Trap;
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
      select
         delay 1.0;
         Door.open;
         Dynamic_Trap.Hit;
         Printer.Print("Burglar opened a door");
      or
         delay 3.0;
         Door.close;
         Printer.Print("Burglar closed the door");
      end select;

   end Burglar;



begin

   null;
end Main;
