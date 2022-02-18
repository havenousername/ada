with Tools;
use Tools;

procedure Main is
   type Select_Place is (S_Clothes, S_Shoes, S_Restaurant);
   -- task Clothes
   task Clothes is
      entry Enter;
      entry Close;
   end Clothes;

   task Restaurant is
      entry Enter;
   end Restaurant;


   task Shoes is
      entry Enter;
      entry Close;
   end Shoes;

   task body Shoes is
      is_open: Boolean := False;
      timeout: Duration;
   begin
      Tools.Randomize.Init;
      Tools.Randomize.Timing(timeout);
      delay timeout;
      is_open := true;

      while is_open loop
         select when is_open =>
               accept Enter  do
                  Printer.Print("Customer entered into Shoes shop");
               end Enter;
         or
            accept Close do
               is_open := False;
            end Close;
         end select;
      end loop;
   end Shoes;

   task body Clothes is
      is_open: Boolean := False;
      timeout: Duration;
   begin
      Randomize.Init;
      Randomize.Timing(timeout);
      is_open := True;
      while is_open loop
         select when is_open =>
               accept Enter do
                  Printer.Print("Customer entered into Clothes shop");
               end Enter;
         or
            accept Close do
               is_open := False;
            end Close;
         end select;
      end loop;
   end Clothes;

   task body Restaurant is
      is_open: Boolean := False;
      timeout: Duration;
   begin
      Randomize.Init;
      Randomize.Timing(timeout);
      is_open := True;
      while is_open loop
         select
            accept Enter  do
               Printer.Print("Customer has entered into Restaurant");
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
               inside := true;
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
            inside := true;
            delay 4.0;
         end if;
      end loop;

      if not (tryWhat = S_Restaurant) then
         Restaurant.Enter;
         inside:= True;
         delay 4.0;
      end if;

   end Customer;

begin
      delay 5.0;
      Clothes.Close;
      Shoes.Close;
end Main;
