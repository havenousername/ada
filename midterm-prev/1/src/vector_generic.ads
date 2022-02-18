generic 
   type Elem is private;
   type Index is (<>);
   type Vector is array(Index range <>) of Elem;
   with function Op(E: Elem) return Boolean;
package vector_generic is
      function Exists(V: Vector; E: Elem) return Boolean;
      function Count_Of_Intersection(V1: Vector; V2: Vector) return Natural;
      function Count_Of_Union(V1: Vector; V2: Vector) return Natural;
end vector_generic;
