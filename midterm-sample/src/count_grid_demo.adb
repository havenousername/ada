with Count_Grid;
with Ada.Text_IO;
use Ada.Text_IO;

procedure count_grid_demo is
   type G_Grid is array (Integer range<>, Integer range<>) of Natural;
   
   Nests: G_Grid(1..10, 1..10) := (others => (others => 0));
   function count_grid_index_integer is new Count_Grid(Integer, G_Grid);
   procedure populate(G: in out G_Grid) is
   begin 
      for I in G'Range(1) loop
         for J in G'Range(2) loop
            G(I, J) := I + J;
         end loop;          
      end loop;
   end populate;
begin
   populate(Nests);
   Put_Line(Natural'Image(count_grid_index_integer(Nests)));
end count_grid_demo;
