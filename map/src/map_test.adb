with Ada.Text_IO, map_package;
use Ada.Text_IO, map_package;



procedure map_test is
   T_Map: Map(5);

   procedure create_test(test_name: String; expected: String; got: Boolean) is
   begin
      New_Line;
      Put_Line(test_name & " - " & expected);
      Put(Boolean'Image(got));
      New_Line;
      Put_Line("End " & test_name);
      New_Line;
   end;


   procedure test_size is
   begin
      clear(T_Map);
      create_test("Test 1 map_package.size()", "Should be 0", size(T_Map) = 0);
      insert(T_Map, 1, 12);

      create_test("Test 2 map_package.size()", "Should be 1", size(T_Map) = 1);

      insert(T_Map, 12, 12);
      insert(T_Map, 13, 12);
      create_test("Test 3 map_package.size()", "Should be 3", size(T_Map) = 3);
   end test_size;

   procedure test_print_clear is
   begin
      -- also testing clear in the beginning. should be applied before each test;
      clear(T_Map);
      New_Line;
      Put_Line("Should put 'Map is empty' to the console");
      print_map(T_Map);
      insert(T_Map, 1, 12);
      Put_Line("Should put first key/value pair to the console");
      print_map(T_Map);
   end test_print_clear;

   procedure test_max_size is
      N_Map: Map(5);
      N_Map1: Map(8);
   begin
      create_test("Test n_Map max size", "Should be 5", max_size(N_Map) = 5);
      create_test("Test n_Map1 max size", "Should be 8", max_size(N_Map1) = 8);
   end;

   procedure test_is_empty is
   begin
      clear(T_Map);
      create_test("Test 1. isEmpty", "Should be true", Is_Empty(T_Map));
      insert(T_Map, 10, 12);
      create_test("Test 2. isEmpty", "Should be false", Is_Empty(T_Map) = False);
      erase(T_Map, 10);
      create_test("Test 3. isEmpty", "Should be true", Is_Empty(T_Map));
   end test_is_empty;

   procedure test_does_key_exist is
   begin
      clear(T_Map);
      insert(T_Map, 10, 12);
      create_test("Test 1. Does key exist", "Should exist", does_Key_Exist(T_Map, 10) = True);
      erase(T_Map, 10);
      create_test("Test 2. Does key exist", "Should not exist", does_Key_Exist(T_Map, 10) = False);
   end test_does_key_exist;

   procedure test_first_key is
   begin
      clear(T_Map);
      create_test("Test 1. First key", "Should be -1", first_Key(T_Map) = -1);
      insert(T_Map, 3, 1);
      insert(T_Map, 9, 1);
      create_test("Test 2. First key", "Should be 3", first_Key(T_Map) = 3);
   end test_first_key;

   procedure test_last_key is
   begin
      clear(T_Map);
      create_test("Test 1. Last key", "Should be -1", last_Key(T_Map) = -1);
      insert(T_Map, 3, 1);
      insert(T_Map, 9, 1);
      create_test("Test 2. Last key", "Should be 9", last_Key(T_Map) = 9);
      erase(T_Map, 9);
      create_test("Test 3. Last key", "Should be 3", last_Key(T_Map) = 3);
   end test_last_key;


   procedure test_find_value is
   begin
      clear(T_Map);
      create_test("Test 1. Find value", "Should be -1", find_Value(T_Map, 90) = -1);
      insert(T_Map, 87, 90);
      insert(T_Map, 83, 88);
      create_test("Test 2. Find value", "Should be 90", find_Value(T_Map, 87) = 90);
      create_test("Test 3. Find value", "Should be 88", find_Value(T_Map, 83) = 88);
      insert(T_Map, 83, 77);
      create_test("Test 4. Find value", "Should be 88", find_Value(T_Map, 83) = 88);
   end test_find_value;

   procedure test_count_value is
   begin
      clear(T_Map);
      insert(T_Map, 10, 10);
      create_test("Test 1. Count value", "Should be 0", count_Value(T_Map, 90) = 0);
      create_test("Test 2. Count value", "Should be 1", count_Value(T_Map, 10) = 1);
      insert(T_Map, 10, 10);
      create_test("Test 3. Count value", "Should be 1", count_Value(T_Map, 10) = 1);
      insert(T_Map, 11, 10);
      insert(T_Map, 14, 10);
      create_test("Test 4. Count value", "Should be 3", count_Value(T_Map, 10) = 3);
   end test_count_value;

   procedure test_insert is
   begin
      clear(T_Map);
      insert(T_Map, 1, 12);
      create_test("Test 1. Insert one value", "Size should be 1", size(T_Map) = 1);
      insert(T_Map, 3, 10);
      insert(T_Map, 5, 10);
      create_test("Test 2. Insert two more values", "Size should be 3", size(T_Map) = 3);
      insert(T_Map, 3, 10);
      insert(T_Map, 3, 10);
      insert(T_Map, 3, 10);
      create_test("Test 3. Insert same values", "Size should be 3, no change; error messages for change trial", size(T_Map) = 3);

      insert(T_Map, 3, 13);
      create_test("Test 5. Insert diff. value into key", "Value under key 3 should be left the same", find_Value(T_Map, 3) = 10);
   end test_insert;

   procedure test_replace is
   begin
      clear(T_Map);
      insert(T_Map, 2, 20);
      replace(T_Map, 2, 10);
      create_test("Test 1. Replace one value", "Value on key should be changed", find_Value(T_Map, 2) = 10);

      replace(T_Map, 1, 10);
      create_test("Test 2. Replace unexistent value", "Should be an error output", True);

      replace(T_Map, 1, 10);

      insert(T_Map, 1, 10);
      replace(T_Map, 1, 20);
      replace(T_Map, 1, 57);
      replace(T_Map, 1, 23);
      create_test("Test 3. Replace value several times on same key", "Value on key should be changed to the last one", find_Value(T_Map, 1) = 23);
   end test_replace;



   procedure test_erase is
   begin
      clear(T_Map);
      erase(T_Map, 12);
      create_test("Test 1. Erase in empty map", "Should not give error, and size = 0", size(T_Map) = 0);
      insert(T_Map, 10, 34);
      insert(T_Map, 1, 4);
      insert(T_Map, 3, 4);
      erase(T_Map, 1);
      create_test("Test 2. Erase in one key in map", "Size = 2", size(T_Map) = 2);
      erase(T_Map, last_Key(T_Map));
      create_test("Test 3. Erase in last key in map", "Size = 1 and last key = 10", size(T_Map) = 1 and last_Key(T_Map) = 10);
      erase(T_Map, first_Key(T_Map));
      create_test("Test 3. Erase in first key in map", "Size = 0", size(T_Map) = 0);
   end test_erase;


   procedure test_remove_insert is
   begin
      clear(T_Map);

      -- checks insert as well (until max size only, not to enter the exception)
      for I in 1..5 loop
         for J in 1..I loop
            insert(T_Map, I + J, I*I);
         end loop;
      end loop;

      print_map(T_Map);
      --  Key:           2, Value:           1
      --  Key:           3, Value:           4
      --  Key:           4, Value:           9
      --  Key:           5, Value:           9
      --  Key:           6, Value:           9

      remove(T_Map, 4, True);
      create_test("Test 1. Remove value only once implicitly", "3 key should not exist", does_Key_Exist(T_Map, 3) = False);
      insert(T_Map, 3, 1);
      remove(T_Map, 1, True);
      create_test("Test 2. Remove all values with 1", "Size should be 2", size(T_Map) = 2);

      remove(T_Map, 9, True);
      create_test("Test 3. Remove all values with 9, leaving empty map", "Size should be 0", size(T_Map) = 0);

   end test_remove_insert;


begin
   test_size;
   test_print_clear;
   test_max_size;
   test_is_empty;
   test_does_key_exist;
   test_first_key;
   test_find_value;
   test_count_Value;
   test_insert;
   test_replace;
   test_erase;
   test_remove_insert;
end map_test;
