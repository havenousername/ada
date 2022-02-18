generic 
   type Element is (<>);
   type Index is (<>);
   type Grid is array(Index range <>, Index range <>) of Element;
   with function predicate(El: Element) return Boolean;
function Count_Values(G: Grid) return Natural;
