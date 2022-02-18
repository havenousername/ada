with More_Than;
with Ada.Text_IO;
use Ada.Text_IO;

procedure more_than_demo is
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
   procedure more_than_grid is new More_Than(Integer, G_Grid); 
begin
   populate(Nests);
   Put_Line(Natural'Image(more_than_grid(Nests, 10)));
end more_than_demo;
