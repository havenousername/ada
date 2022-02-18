-----------------------------------------------------------------

-- This solution was submitted and prepared by Cristea Andrei, W61RAB for the mid-term assignment of the Ada Programming course.



-- I declare that this solution is my own work.



-- I have not copied or used third-party solutions.



-- I have not passed my solution to my classmates, neither made it public.







-- it will count as a disciplinary fault.



-- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.
with Vector_Gen;
with Ada.Text_IO;
use Ada.Text_IO;


procedure Main is
   package Integer_Vector is new Vector_Gen(Integer);
   Int_Arr: Integer_Vector.Vector;

   function my_action(I: in out Integer) return Integer is
   begin
      return I * I * I;
   end my_action;

   procedure my_For_Each is new Integer_Vector.ForEach(my_action);
begin
   -- activate for error
   -- Integer_Vector.pop(Int_Arr);
   Integer_Vector.insert(Int_Arr, 1);
   Integer_Vector.insert(Int_Arr, 2);
   my_For_Each(Int_Arr);
   Integer_Vector.print_vector(Int_Arr);
exception
   when others =>
      Put_Line("Underflow error");

end Main;
