with Tools;
use Tools;

-- This solution was submitted and prepared by Cristea Andrei, W61RAB for the mid-term assignment of the Ada Programming course.



-- I declare that this solution is my own work.



-- I have not copied or used third-party solutions.



-- I have not passed my solution to my classmates, neither made it public.











-- it will count as a disciplinary fault.



-- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.
procedure Main is
   task Hostipal is
      entry vaccinate;
   end Hostipal;

   task body Hostipal is
      timeout: Duration;
   begin
      Tools.Randomize.Init;
      Tools.Randomize.Timing(timeout);
      delay timeout;
      select
         accept vaccinate do Printer.Print("Patient is vaccinating"); end;
      or
         terminate;
      end select;

   end Hostipal;

   task Patient;
   task body Patient is
   begin
      select
         Hostipal.vaccinate;
         Printer.Print("Patient was vaccinated");
      or
         delay 0.5;
         Printer.Print("Patient wasnt vaccinated");

      end select;
   end Patient;


begin
   null;
end Main;
