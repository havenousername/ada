with Ada.Text_IO;
with LinkedList;
with Ada.Strings.Bounded;
use Ada.Text_IO;

procedure linkedlist_main is
   package B_Strings is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 24);
   -- type VarChar2 is array (1..256) of B_Strings.Bounded_String;
   package String_Linked_List is new LinkedList(B_Strings.Bounded_String);
   
   type Bounded_String_Array is array(Integer range<>) of B_Strings.Bounded_String;
     
   
   main_list: String_Linked_List.ListComponent;
   
   procedure empty_list_handler is
   begin
      Put_Line("List is empty");
   end empty_list_handler;
   
   procedure tranverse_one(E: B_Strings.Bounded_String) is
   begin
      Put_Line(B_Strings.To_String(E));
   end tranverse_one;
   
   procedure replace_item(E: in out B_Strings.Bounded_String) is 
   begin
      E := B_Strings.To_Bounded_String("*Best Language*");
   end replace_item;
   
   
   procedure traverse_linked_strings is new String_Linked_List.traverse(empty_list_handler, tranverse_one);
 
   procedure replace_linked_strings is new String_Linked_List.replace_items(replace_item);
   
   chs: Bounded_String_Array := (
                                B_Strings.To_Bounded_String("Worst Language"),
                                B_Strings.To_Bounded_String("in"),
                                B_Strings.To_Bounded_String("world"),
                                B_Strings.To_Bounded_String("Is"),
                                B_Strings.To_Bounded_String("ADA")
                                );
   
    type String_Array is array(Positive range<>) of String(1..40);
   ProhibitedWords: Bounded_String_Array := ( 
                                              B_Strings.To_Bounded_String("Programming sucks"), 
                                              B_Strings.To_Bounded_String("Worst Language"), 
                                              B_Strings.To_Bounded_String("Dont like it")
                                             );
begin
   for I in chs'Range loop
      String_Linked_List.add(main_list, chs(I));
   end loop;
   traverse_linked_strings(main_list);
   for I in ProhibitedWords'Range loop
      replace_linked_strings(main_list, ProhibitedWords(I));
   end loop;
   
   
   
   New_Line;
   traverse_linked_strings(main_list);
   
   String_Linked_List.free(main_list); 
end linkedlist_main;
