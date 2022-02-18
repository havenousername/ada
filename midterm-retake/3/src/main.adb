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
begin
   -- activate for error
   -- Integer_Vector.pop(Int_Arr);
   -- should be false
   Put_Line(Boolean'Image(Integer_Vector.is_empty(Int_Arr)));
   Integer_Vector.insert(Int_Arr, 1);
   Integer_Vector.insert(Int_Arr, 2);
   Integer_Vector.insert(Int_Arr, -100);
   Integer_Vector.insert(Int_Arr, 200);
   Integer_Vector.insert(Int_Arr, 5);
   Integer_Vector.insert(Int_Arr, 8);
   Integer_Vector.print_vector(Int_Arr);
   -- should be true
   Put_Line(Boolean'Image(Integer_Vector.is_empty(Int_Arr)));
   -- should be 1
   Put_Line(Integer'Image(Integer_Vector.first(Int_Arr)));
   -- should be 8
   Put_Line(Integer'Image(Integer_Vector.last(Int_Arr)));

   Integer_Vector.remove(Int_Arr, -100);
   -- should be without 8, all others are there
   Integer_Vector.print_vector(Int_Arr);


   Integer_Vector.insert(Int_Arr, 200);
   Integer_Vector.print_vector(Int_Arr);
   Integer_Vector.remove(Int_Arr, 200);

    Integer_Vector.print_vector(Int_Arr);
   -- should be 1,  2,  5,  8,
exception
   when others =>
      Put_Line("Underflow error");

end Main;
