with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Real_Time, Ada.Numerics.Float_Random, Ada.Calendar;
use Ada.Text_IO;
use Ada.Real_Time;



procedure Endterm is
   package Random_Dur is new Ada.Numerics.Discrete_Random(Positive); use Random_Dur;
   type Select_Place is (S_Clothes, S_Shoes, S_Restaurant);
   -- task types
   G:Generator;

   protected Printer is
      procedure Print(S: in String);
   end Printer;

   protected body Printer is
      procedure Print(S: String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;




   task Clothes is
      entry Enter;
      entry Close;
   end Clothes;

   task Shoes is
      entry Enter;
      entry Close;
   end Shoes;

   task Restaurant is
      entry Enter;
   end Restaurant;



   task body Clothes is
      is_open: Boolean := False;
      timeout: Duration;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay timeout;
      Is_Open := true;
      while is_open loop
         select when is_open =>
               accept Enter  do
                Printer.Print("Customer entered into Clothes shop");
               end Enter;

         or
               accept Close  do
                 is_open := False;
               end Close;
         end select;
      end loop;
   end Clothes;


    task body Shoes is
      is_open: Boolean := False;
      timeout: Duration;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay timeout;
      Is_Open := true;
      while is_open loop
         select when is_open =>
               accept Enter  do
                Printer.Print("Customer entered into Shoes shop");
               end Enter;

         or
               accept Close  do
                 is_open := False;
               end Close;
         end select;
      end loop;
   end Shoes;


   task body Restaurant is
      Is_Open: Boolean := False;
       timeout: Duration;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay Duration(timeout);
      is_open := true;
      while is_open loop
         select
               accept Enter  do
                  Printer.Print("Customer entered into Restaurant");
                  Is_Open := False;
               end Enter;
         or

             terminate;
         end select;
      end loop;

   end Restaurant;

   task Customer;

   task body Customer is
      inside: Boolean := false;
      tryWhat: Select_Place := S_Clothes;
   begin
      delay 1.0;
      while not inside loop
         if tryWhat = S_Clothes then
            select
               Clothes.Enter;
               inside := True;
               delay 3.0;
            else
                 tryWhat := S_Shoes;
                 delay 2.0;
            end select;
         elsif tryWhat = S_Shoes then
            select
               Shoes.Enter;
               inside := True;
               delay 3.0;
            else
              tryWhat := S_Restaurant;
              delay 2.0;
            end select;
         else
            Restaurant.Enter;
            inside := True;
            delay 4.0;
         end if;
      end loop;

      if not (tryWhat = S_Restaurant) then
         Restaurant.Enter;
         inside := True;
         delay 4.0;
      end if;

   end Customer;
begin
   delay 5.0;
   Clothes.Close;
   Shoes.Close;
end Endterm;
