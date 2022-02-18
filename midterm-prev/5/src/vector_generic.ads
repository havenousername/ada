generic 
   type Elem is private;
   type Index is (<>);
   type Vector is array(Index range <>) of Elem;
   with function Op(E: Elem) return Boolean;
package vector_generic is
   generic
      with function Action(E: in out Elem) return Elem;
   procedure ForEach(V: in out Vector);
   function Exists(V: Vector; E: Elem) return Boolean;
   function Count_Of_Intersection(V1: Vector; V2: Vector) return Natural;
   function Count_Of_Union(V1: Vector; V2: Vector) return Natural;
   function Count_Of_Difference(V1: Vector; V2: Vector) return Natural;
   function Count_Of_Repetitions(V: Vector; E:Elem) return Natural;
   function Max_Of_Repetitions(V: Vector) return Elem;
   function Compare(A: Elem; B: Elem) return Boolean;
   function "<"(V1: Vector; V2: Vector) return Boolean;
   
end vector_generic;
