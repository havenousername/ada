generic 
   type Elem is (<>);
package Vector_Gen is
   subtype Length is Positive range 1..10000;
   type Vector(Max: Length := 100) is limited private;
   procedure insert(V: in out vector; item: Elem);
   procedure pop(V: in out Vector);
   function size(V: in Vector) return Natural;
   procedure print_vector(V: in Vector);
   -- ====
   function first(V: in Vector) return Elem;
   function last(V: in Vector) return Elem;
   function is_empty(V: in Vector) return Boolean;
   procedure remove(V: in out Vector; item: Elem);
   procedure remove_all(V: in out Vector; item: Elem);
   
   -- ====
   procedure swap(V1, V2: in out vector);
   procedure join(V1, V2: in out vector);
   function compare(V1, V2:vector) return Boolean;
   procedure clear(V: in out Vector);
private
   type TArray is array(Positive range<>) of Elem;
   
      type Vector (Max: Length := 100) is 
         record 
            Value: TArray(1..Max);
            Pointer: Natural := 0;
         end record;
      
       
end Vector_Gen;
