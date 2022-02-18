with Ada.Text_IO;
with Count_Values;
use Ada.Text_IO;

procedure count_values_demo is
   type G_Grid is array(Integer range<>, Integer range<>) of Natural;
   Nests: G_Grid(1..10, 1..10) := (others => (others => 0));
   
   procedure populate(G: in out G_Grid) is
   begin 
      for I in G'Range(1) loop
         for J in G'Range(2) loop
            G(I, J) := I + J;
         end loop;          
      end loop;
   end populate;
   
   function predicate(val: Natural) return Boolean is 
   begin
      return val > 3;
   end predicate;
   
   function more_than_grid is new Count_Values(Natural, Integer, G_Grid, predicate); 
begin
   populate(Nests);
   Put_Line(Integer'Image(more_than_grid(Nests)));
end count_values_demo;
