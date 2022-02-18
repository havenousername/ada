with Ada.Text_IO;
use Ada.Text_IO;
procedure main is
generic
type T is private;
with function "+"(x,y: T) return T is <>;
function FG(a,b: T) return T;

function f is new FG(Float,"+");
function g is new FG(Integer);
begin
 Put_Line(Boolean'Image( N1 = N2));
end main;
