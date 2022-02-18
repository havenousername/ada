generic
   type List_Type is private;
package LinkedList is
   type ListComponent is limited private;
   type List_Type_Access is limited private;
   type Return_Arr is array(Positive range<>) of List_Type;
   
   procedure add(L: in out ListComponent; E: List_Type);
   procedure add(L: in out ListComponent; E: Return_Arr);
   
   generic
      with procedure emptyListHandle;
      with procedure action(E: List_Type);
   procedure traverse(L: ListComponent);
   procedure free(L: in out ListComponent);
   
   function size(L: in out ListComponent) return Natural;
   function To_Array(L: in out ListComponent) 
                     return Return_Arr;
   generic 
      with procedure replace_pattern(E: in out List_Type);
   procedure replace_items(L: in out ListComponent; E: List_Type);   
private
   type List is 
      record
         Node: List_Type;
         Next: List_Type_Access;
      end record;
   
   type List_Type_Access is access List;
   
   type ListComponent is 
      record
         Start_Node: List_Type_Access;
         End_Node: List_Type_Access;
   end record;
   
end LinkedList;
