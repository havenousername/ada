generic
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Natural;
   function Count_Grid(Gr: Grid) return Natural;
