with Ada.Text_IO;
use Ada.Text_IO;

package body Tools is
   protected body Printer is 
      procedure Print(S: in String) is 
      begin 
         Put_Line(S);
      end Print;
   end Printer;
   
   protected body Randomize is
      procedure Init is 
      begin
         Reset(G);
         Initial := True;
      end Init;
      
      entry Timing(value: out Duration;
                   from: in Duration := 0.0; 
                   to: in Duration := 1.0)
        when Initial is 
      begin
         value := Duration(Random(G)) * (to-from) + from;
      end Timing;   
   end Randomize;

   
end Tools;
