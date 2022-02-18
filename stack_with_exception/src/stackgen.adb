package body Stackgen is
   
   procedure Push(V: in out Stack; E: in Elem) is
   begin 
      if Is_Full(V) then 
         raise Full_Stack;
      end if;
      
      V.Pointer := V.Pointer + 1;
      V.Data(V.Pointer) := E;
   end Push;
   
   procedure Pop(V: in out Stack; E: out Elem) is
   begin
      if Is_Empty(V) then
         raise Empty_Stack;
      end if;
      
      E := Top(V);
      V.Pointer := V.Pointer - 1;
   end Pop;
   
   function Top(V: Stack) return Elem is
   begin
      return V.Data(V.Pointer);
   exception
      when
           Constraint_Error => raise Empty_Stack;
   end Top;
   
   function Is_Full(V: Stack) return Boolean is 
   begin
      return V.Pointer = V.Max;
   end Is_Full;
   
   function Is_Empty(V: Stack) return Boolean is
   begin
      return V.Pointer = 0;
   end Is_Empty;
   
   function Size(V: Stack) return Natural is
   begin
      return V.Pointer;
   end;
   
   
end Stackgen;
