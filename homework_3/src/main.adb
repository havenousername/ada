with Ada.Text_IO, Ada.Numerics.Discrete_Random, Ada.Calendar;
with Ada.Real_Time; use Ada.Real_Time;
use Ada.Text_IO;

-- 1 minute -> 0.1
procedure Main is
   -- constants
   NUMBER_OF_PARKING_SPACES: constant Positive := 3;
   NUMBER_OF_CARS: constant Positive := 20;
   -- generator for random and random package itself
   package Random_Fl is new Ada.Numerics.Discrete_Random(Positive);
   use Random_Fl;
   G: Generator;

   -- tasks declaration
   type P_String is access String;
   task type Car (Plate_Number: P_String);

   task type Parking_Space is
      entry enter;
      entry leave;
      entry close;
   end Parking_Space;

   -- declaration of variables
   type P_Parking_Space is access Parking_Space;
   type P_Car is access Car;

   cars: array(1..NUMBER_OF_CARS) of P_Car;
   parking_spaces: array(1..NUMBER_OF_PARKING_SPACES) of P_Parking_Space;
   type Arr is array(Positive range<>) of Natural;

   -- protected print
   protected Printer is
      procedure Print(S: String);
   end Printer;

   protected body Printer is
      procedure Print(S: String) is
      begin
         Put_Line(S);
      end Print;
   end Printer;

   protected Parking_Counter is
      procedure Increment(I: Positive);
      function Result(I: Positive) return Natural;

   private
      Counters: Arr(1..NUMBER_OF_PARKING_SPACES) := (others => 0);
   end Parking_Counter;

   protected body Parking_Counter is
      procedure Increment(I: Positive) is
      begin
         Counters(I) := Counters(I) + 1;
      end Increment;

      function Result(I: Positive) return Natural is
      begin
         return Counters(I);
      end Result;
   end Parking_Counter;



   -- tasks body
   task body Car is
     rand_choose: Positive;
     inside_parking: Boolean := False;
   begin
      Reset(G);
      rand_choose := (Random(G) rem 3) + 1;
      delay 1.0;
      select
         parking_spaces(rand_choose).enter;
         Printer.Print(Plate_Number.all & " occupied parking space with number: " & rand_choose'Image);
         Parking_Counter.Increment(rand_choose);
         inside_parking := True;
         delay 2.0;
         parking_spaces(rand_choose).leave;
         Printer.Print(Plate_Number.all & " left parking space with number: " & rand_choose'Image);
      else
         delay 0.5;
         parking_spaces(rand_choose).enter;
         Printer.Print(Plate_Number.all & " occupied parking space from second time with number: " & rand_choose'Image);
         Parking_Counter.Increment(rand_choose);
         inside_parking := True;
         delay 2.0;
         parking_spaces(rand_choose).leave;
         Printer.Print(Plate_Number.all & " left parking space with number: " & rand_choose'Image);
      end select;


      if not inside_parking then
         Printer.Print(Plate_Number.all & " gave up occuping parking with number: " & rand_choose'Image);
      end if;
   end Car;

   task body Parking_Space is
      Is_Open: Boolean := False;
      cars_inside: Natural := 0;
      nrCustomers : Natural := 0;
   begin
      Reset(G);
      -- delay Duration(Float(Random(G)));
      Is_Open := True;

      while Is_Open loop
         delay 0.1;
         select when cars_inside < 6 =>
               accept enter  do
                  cars_inside := cars_inside + 1;
                  nrCustomers := nrCustomers + 1;
               end enter;
         or
            accept leave  do
               cars_inside := cars_inside - 1;
            end leave;
         or
            accept close do
               Is_Open := False;
            end close;
         end select;
      end loop;

       Printer.Print ("Shop served " & nrCustomers'Image & " customers");
   end Parking_Space;

   -- main vars
   start_time: Time;
   mid_time: Time;
   time_passed: Time_Span;

   cars_created: Natural := NUMBER_OF_CARS;
begin
   for i in parking_spaces'Range loop
      parking_spaces(i) := new Parking_Space;
      delay 0.2;
   end loop;

   start_time := Clock;

   for i in cars'Range loop
      cars(i) := new Car(new String'(i'Image));
      delay 0.1;
   end loop;

   mid_time := Clock;
   time_passed := mid_time - start_time;
   while time_passed < Time_Span_Unit * 1000000000 * 12 loop
      for i in cars'Range loop
         if cars(i)'Terminated then
            cars(i) := new Car(new String'(i'Image));
            cars_created := cars_created + 1;
         end if;
      end loop;
      mid_time := Clock;
      time_passed := mid_time - start_time;
   end loop;

   for i in parking_spaces'Range loop
      parking_spaces(i).close;
   end loop;

   for i in 1..NUMBER_OF_PARKING_SPACES loop
      Put_Line("Parking with number: " & i'Image & " had served " & Parking_Counter.Result(I)'Image & " cars");
   end loop;


   Put_Line("Totally there were " & cars_created'Image & " cars created");
end Main;
