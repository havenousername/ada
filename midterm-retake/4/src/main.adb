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
   Int_Arr1: Integer_Vector.Vector;
   Int_Arr2: Integer_Vector.Vector;
begin
   Integer_Vector.insert(Int_Arr1, 1);
   Integer_Vector.insert(Int_Arr1, 100);
   Integer_Vector.insert(Int_Arr2, 2);
   Integer_Vector.swap(Int_Arr1, Int_Arr2);
   Integer_Vector.print_vector(Int_Arr1);
   Integer_Vector.print_vector(Int_Arr2);

   Integer_Vector.join(Int_Arr1, Int_Arr2);

   Integer_Vector.print_vector(Int_Arr1);

   -- should be FALSE
   Put_Line(Boolean'Image(Integer_Vector.compare(Int_Arr1, Int_Arr2)));
   -- Should be TRUE
   Put_Line(Boolean'Image(Integer_Vector.compare(Int_Arr1, Int_Arr1)));

   Integer_Vector.clear(Int_Arr1);
   Integer_Vector.print_vector(Int_Arr1);
    Put_Line(Boolean'Image(Integer_Vector.is_empty(Int_Arr1)));
   -- should be empty

exception
   when others =>
      Put_Line("Underflow error");

end Main;
