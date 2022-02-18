generic
   type Elem is private;
   type Index is (<>);
   type RArray is array(Index range <>) of Elem;  
   with procedure replace_pattern(E: in out Elem);
procedure replace_g(R_Target: in out RArray; Pattern: Elem);
