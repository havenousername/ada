
-- Ada Programming & endterm, 2021. May. 14.
-- This solution was submitted and prepared by <Parim Suka, ILOFTP> for the endterm assignment of the Ada Programming course.
-- I declare that this solution is my own work.
-- I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, neither made it public.
-- Students' regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.) states that as long as
-- a student presents another student's work - or at least the significant part of it - as his/her own performance,
-- it will count as a disciplinary fault.
-- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.

with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random; use Ada.Text_IO;

procedure endterm is
   
   package Random_Nr is new Ada.Numerics.Discrete_Random(Natural); use Random_Nr;
   G:Generator;
   
   
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
      capacity : Natural := 0;
   begin
      Helper.Generate_First_Random_Number(rand);
      delay Duration(rand);
      open_now := true;
      
      while open_now loop
         select when rand < 0.5 and capacity < 5 =>
            accept admission  do
                  Printer.Print("The patient got admitted, he is waiting for the vaccine");
                  capacity := capacity + 1;
                  delay 0.5;
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
      exception
         when tasking_error =>     
            Printer.Print("hospital closed?"); 
   end Hospital;
   
   type PString is access string;
   
   task type Patient (name : PString);
   task body Patient is
      takeVaccine : Boolean;
      rand : Natural;
      gotVaccine : Boolean := False;
   begin
      
      Reset(G);
      rand := random(G) rem 2;
      
      if rand = 0 then
        takeVaccine := True;
      else
        takeVaccine := False;
      end if;
      
      
      if takeVaccine then
         select
            Hospital.admission;
            Printer.Print (name.all & " got vaccinated");
            gotVaccine := True;
         or
              --Trying again after 5 minutes
           delay 0.5;
         end select;
         
         --If he didnt get the vaccine, he tries once again
         if not gotVaccine then
            select
               Hospital.admission;
               Printer.Print (name.all & " got vaccinated");
            or
               delay 0.1;
               Printer.Print (name.all & " could not get the vaccine today");
            end select;
         end if;
      else
         Reset(G);
         rand := random(G) rem 2;
      
         if rand = 0 then
            takeVaccine := True;
         else
            takeVaccine := False;
         end if;
         
         if takeVaccine then
            select
               Hospital.admission;
               Printer.Print (name.all & " got vaccinated");
            or
               delay 0.1;
            end select;
            select
               Hospital.admission;
               Printer.Print (name.all & " got vaccinated");
            or
               delay 0.1;
               Printer.Print (name.all & " could not get the vaccine today");
            end select;
         end if;
         
      end if;
      
   end Patient;
   
   type PPatient is access Patient;
   Patients: array (1..10) of PPatient;
   
begin
   for i in Patients'Range loop
      Patients (i) := new Patient (new String'(i'Image));
      delay 0.5;
   end loop;
   
end endterm;
