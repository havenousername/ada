package bag is
   subtype Length is Positive range 1..100;
   subtype Count is Positive;
   subtype Elem is Integer;
   
   type Bag(Max: Length) is limited private;
   
   procedure insert_one(S: in out Bag; elem: Integer);
   procedure insert_multiple(S: in out Bag; elem: Integer; amount: Positive);
   procedure extract_one(S: in out Bag; elem: Integer);
   procedure extract_multiple(S: in out Bag; elem: Integer; amount: Positive);
   
private 
   type IArray is array (Integer range <>) of Elem;
   type PArray is array (Integer range <>) of Count;
   type Bag(Max: Length) is record 
      Elem: IArray(1..Length);
      Count: PArray(1..Positive'Max);
      Current: Natural := 0;
end bag;
