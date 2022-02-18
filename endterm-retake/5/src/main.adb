with Tools;
with Ada.Numerics.Discrete_Random, Ada.Calendar, Ada.Text_IO;
use Tools;
with Ada.Real_Time; use Ada.Real_Time;
use Ada.Text_IO;

procedure Main is
   type Vaccine is (Pfizer,Sinopharm, Sputnik, Janssen);
   task type Hostipal is
      entry vaccinate(V: Vaccine);
   end Hostipal;

   protected Officer is
      procedure up;
      procedure getNumber;
   private
      number_of_vaccinated : Natural := 0;
   end Officer;

   protected body Officer is
      procedure up is
      begin
         number_of_vaccinated := number_of_vaccinated + 1;
      end up;

      procedure getPercentage is
      begin
      end getPercentage;





   task body Hostipal is
      timeout: Duration;
      sizeOfVaccine: Duration;
       type Map_Vaccine is record

               name: Vaccine;
               count: Natural;
            end record;
      type V_Array is array(Positive range<>) of Map_Vaccine;
      Vaccine_Arr: V_Array := ((Pfizer, 4), (Sinopharm, 4), (Sputnik, 4), (Janssen, 4));
      start_time: Time;
      mid_time: Time;
      time_passed: Time_Span;
      capacity : Natural := 0;
   begin
      start_time := Clock;
      for i in Vaccine_Arr'Range loop
         Tools.Randomize.Init;
         Tools.Randomize.Timing(sizeOfVaccine);
         if sizeOfVaccine < 0.5 then
            Vaccine_Arr(I).count := 3;
         else
            Vaccine_Arr(I).count := 4;
         end if;
      end loop;

      Tools.Randomize.Init;
      Tools.Randomize.Timing(timeout);
      delay timeout;

      mid_time := Clock;
      time_passed := mid_time - start_time;

      while time_passed < Time_Span_Unit * 100000000 * 12 loop
         select when capacity < 5 =>
               accept vaccinate(V: Vaccine) do
                  if V = Pfizer then
                     Vaccine_Arr(2).count := Vaccine_Arr(2).count - 1;
                  elsif V = Sinopharm then
                     Vaccine_Arr(4).count := Vaccine_Arr(2).count - 1;
                  elsif V = Sputnik then
                     Vaccine_Arr(1).count := Vaccine_Arr(1).count - 1;
                  else
                      Vaccine_Arr(2).count := Vaccine_Arr(2).count - 1;
                  end if;

                  Printer.Print("Patient was vaccinated");
               end vaccinate;
         or
              delay 0.5;
         end select;
         mid_time := Clock;
         time_passed := mid_time - start_time;
      end loop;
      exception
         when tasking_error =>
            Printer.Print("hospital closed?");
   end Hostipal;

   type PHospital is access Hostipal;
   Hostipals: array(1..3) of PHospital;


   type PString is access String;
   task type Patient(Name: PString; PV: Vaccine; index : Natural);

   task body Patient is
      gotVaccine : Boolean := False;
   begin
      select
         Hostipals(index).vaccinate(PV);
         if PV = Pfizer then
                    Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Sinopharm));
         elsif PV = Sinopharm then
                     	Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Janssen));
         elsif PV = Sputnik then
            Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Pfizer));
         else
            Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Sinopharm));
         end if;
         gotVaccine := True;
      or
         delay 0.5;
      end select;

      if not gotVaccine then
         select
            Hostipals(index).vaccinate(PV);
            if PV = Pfizer then
                    Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Sinopharm));
            elsif PV = Sinopharm then
               Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Janssen));
            elsif PV = Sputnik then
               Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Pfizer));
            else
               Printer.Print("Patient " & Name.all &  " was vaccinated with " &  Vaccine'Image(Sinopharm));
            end if;
            gotVaccine := true;
         else
              Printer.Print("Patient " & Name.all &  " was not vaccinated");
         end select;

      end if;
   end Patient;

    type PPatient is access Patient;
   Patients: array (1..30) of PPatient;

   V_V: Vaccine;
   random_vaccine: Duration;
   random_hospital: Duration;
begin
   for i in Hostipals'Range loop
      Hostipals(I) := new Hostipal;
   end loop;

   for I in Patients'Range loop
      Tools.Randomize.Init;
      Tools.Randomize.Timing(random_vaccine, 0.0, 4.0);
      if random_vaccine < 1.0 then
         V_V := Pfizer;
      elsif random_vaccine < 2.0 then
         V_V := Sinopharm;
      elsif random_vaccine < 3.0 then
         V_V := Sputnik;
      else
         V_V := Janssen;
      end if;

      Tools.Randomize.Init;
      Tools.Randomize.Timing(random_vaccine, 1.0, 3.0);


      Patients(i) := new Patient(new String'(i'Image), V_V, Positive(random_vaccine));
   end loop;

end Main;
