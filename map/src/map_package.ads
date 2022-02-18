package map_package is
   subtype Length is Positive range 1..1000;

   type Map(Max: Length := 100) is limited private;
 
   function size(M: Map) return Natural; -- the size of a Map
   function max_size(M: Map) return Length; -- the maximum size of a Map
   function is_Empty (M: Map) return Boolean; -- is Map empty
   function does_Key_Exist (M: Map; key: Integer) return Boolean; -- searches for the given key in Map
   function first_key(M: Map) return Integer; -- key to the first pair in the Map
   function last_key(M: Map) return Integer; -- key to the last pair in the Map
   function find_value(M: Map; key : Integer) return Integer; -- value for the given key if exits, othwervise returns -1
   function count_value(M: Map; value : Integer) return Integer; -- count of the value in a Map
   procedure insert(M: in out Map; key, value: Integer); -- insert key, value pair into the Map
   procedure erase(M: in out Map; key: Integer); -- erase key, value pair from Map
   procedure remove(M: in out Map; value: Integer; all_occurrences: Boolean:= False); -- remove value from the Map, with all_occurrences False as default to remove first occurrence only, otherwise remove all occurrences
   -- fixed issue #2: added replace procedure, fixed all ads function parameters (same as in the task) 
   procedure replace(M: in out Map; key, value: Integer); -- replace current value with given value in a given key
   procedure clear(M: in out Map); -- clear the Map and make it empty
   procedure print_Map(M: in Map); -- prints the Map
   
private
   type TArray is array(Positive range<>) of Integer;
   type Map(Max: Length := 100) is 
      record
         Key: TArray(1..Max) := (others => Integer'First);
         Value: TArray(1..Max);
         Pointer: Natural := 0;
      end record;
end map_package;
