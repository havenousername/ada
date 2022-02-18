
-- Ada Programming & endterm, 2021. May. 14.
-- This solution was submitted and prepared by <Parim Suka, ILOFTP> for the endterm assignment of the Ada Programming course.
-- I declare that this solution is my own work.
-- I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, neither made it public.
-- Students' regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.) states that as long as
-- a student presents another student's work - or at least the significant part of it - as his/her own performance,
-- it will count as a disciplinary fault.
-- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.

with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Calendar; use Ada.Text_IO;

procedure endterm is
   
   
   protected Printer is 
        procedure Print(str : in STRING := "");
    end Printer;
    protected body Printer is
        procedure Print(str : in STRING := "") is
        begin
            Put_Line(str);
        end Print;
   end Printer;
   
   protected Helper is
      procedure Generate_First_Random_Number (Result : out Float);
      private
      Gen : Ada.Numerics.Float_Random.Generator;
   end Helper;
   protected body Helper is
       procedure Generate_First_Random_Number (Result : out Float)
       is
         Rnd : constant Float := Ada.Numerics.Float_Random.Random (Gen);
      begin
         Result := Rnd;
       end Generate_First_Random_Number;
   end Helper;
   
   
   task Hospital is
      entry admission;
      entry vaccinate;
   end Hospital;
   
   task body Hospital is
      open_now : Boolean := false;
      rand : Float;
   begin
      Helper.Generate_First_Random_Number(rand);
      delay Duration(rand);
      open_now := true;
      
      while open_now loop
         select when rand < 0.5 =>
            accept admission  do
                  Printer.Print("The patient got admitted, he is waiting for the vaccine");
            end admission;
         or 
            accept vaccinate do
               Printer.Print("The patient got vaccinated");
               delay 0.1;
            end vaccinate;
         or
              terminate;
         end select;
      end loop;

   end Hospital;
   
   task Patient;
   task body Patient is
      
   begin
      loop
         Hospital.admission;
         Hospital.vaccinate;
      end loop;
   end;
   
   
begin
   null;
end endterm;
