with Ada.Text_IO;
with migrate;
use Ada.Text_IO;

procedure migrate_demo is
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
   procedure migrate_grid is new migrate(Integer, G_Grid);
begin
   null;
end migrate_demo;
