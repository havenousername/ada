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
      entry Close;
   end Restaurant;



   task body Clothes is
      is_open: Boolean := False;
      timeout: Duration;
      count: Natural := 0;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay timeout;
      Is_Open := true;
      while is_open loop
         select when is_open =>
               accept Enter  do
                  Printer.Print("Customer entered into Clothes shop");
                  count := count + 1;
               end Enter;

         or
               accept Close  do
                 is_open := False;
               end Close;
         end select;
      end loop;
      Printer.Print("Served " & count'Image &  "customers");
   end Clothes;


    task body Shoes is
      is_open: Boolean := False;
      timeout: Duration;
      count: Natural := 0;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay timeout;
      Is_Open := true;
      while is_open loop
         select when is_open =>
               accept Enter  do
                  Printer.Print("Customer entered into Shoes shop");
                  count := count + 1;
               end Enter;

         or
               accept Close  do
                 is_open := False;
               end Close;
         end select;
      end loop;
      Printer.Print("Served " & count'Image &  "customers");
   end Shoes;


   task body Restaurant is
      Is_Open: Boolean := False;
      timeout: Duration;
      count: Natural := 0;
   begin
      Reset(G);
      timeout := Duration(Float(Random(G) rem 1)/10.0);
      delay Duration(timeout);
      is_open := true;
      while is_open loop
         select
               accept Enter  do
                  Printer.Print("Customer entered into Restaurant");
                  count := count + 1;
               end Enter;
         or

              accept Close  do
                 is_open := False;
               end Close;
         end select;
      end loop;
      Printer.Print("Served " & count'Image &  "customers");
   end Restaurant;

   type PString is access string;
   task type Customer(name: PString);

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
               delay 4.0;
            else
                 tryWhat := S_Shoes;
                 delay 3.0;
            end select;
         elsif tryWhat = S_Shoes then
            select
               Shoes.Enter;
               inside := True;
               delay 4.0;
            else
              tryWhat := S_Restaurant;
              delay 3.0;
            end select;
         else
            Restaurant.Enter;
            inside := True;
            delay 4.0;
         end if;
      end loop;
   end Customer;

   c1: Customer(new String'("h"));
   c2: Customer(new String'("h1"));
   c3: Customer(new String'("h2"));
   c4: Customer(new String'("h3"));
   c5: Customer(new String'("h"));
   c6: Customer(new String'("h1"));
   c7: Customer(new String'("h2"));
   c8: Customer(new String'("h3"));
   c9: Customer(new String'("h"));
   c10: Customer(new String'("h1"));
   c11: Customer(new String'("h2"));
   c12: Customer(new String'("h3"));
   c13: Customer(new String'("h"));
   c14: Customer(new String'("h1"));
   c15: Customer(new String'("h2"));
begin
   delay 20.0;
   Clothes.Close;
   Shoes.Close;
   Restaurant.Close;
end Endterm;
