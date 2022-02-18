with Ada.Text_IO;
use Ada.Text_IO;

function most_frequent(M_Arr: Arr) return Elem is 
   
   type TArray is array(Positive range<>) of Natural;
   type UArray is array(Positive range<>) of Elem; 
   Count_Array: TArray(1..M_Arr'Length);
   Uniq_Array: UArray(1..M_Arr'Length);
   Pointer: Natural := 0;
   Fr: Elem;
   Fr_Count: Natural := 0;
begin
   for I in M_Arr'Range loop
      declare 
         found_position: Boolean := False;
      begin
         for J in 1..Pointer loop
            if Uniq_Array(J) = M_Arr(I) then  
               Count_Array(J) := Count_Array(J) + 1;
               found_position := True;
            end if;
         end loop;
         
         if not found_position then 
            Pointer := Pointer + 1;
            Count_Array(Pointer) := 1;
            Uniq_Array(Pointer) := M_Arr(I);
         end if;
      end;
   end loop;
   
   
   for I in 1..Pointer loop
      --  Put_Line(Elem'Image(Uniq_Array(I)));
      --  Put_Line(Positive'Image(Count_Array(I)));
      --  New_Line;
      if Count_Array(I) > Fr_Count and Is_Valid(Uniq_Array(I)) then 
         Fr_Count := Count_Array(I);
         Fr := Uniq_Array(I);
      end if;
   end loop;
   
   return Fr;
end;
