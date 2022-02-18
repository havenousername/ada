generic 
   type Elem is private;
   type Index is (<>);
   type Vector is array(Index range<>) of Elem;
   with procedure activity(E: in out Elem);
procedure for_all(V: in out Vector);
