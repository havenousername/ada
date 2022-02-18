generic 
   type Elem is private;
   type Index is (<>);
   type Arr is array(Index range<>) of Elem;
   with function is_valid(E: Elem) return Boolean; 
 function most_frequent(M_Arr: Arr) return Elem;
