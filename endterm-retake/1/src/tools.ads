with Ada.Numerics.Float_Random;
use Ada.Numerics.Float_Random;

package Tools is
   protected Randomize is 
      procedure Init;
      entry Timing(
                   value: out Duration;
                   from: in Duration := 0.0;
                   to: in Duration := 1.0
                  );
   private
      G: Generator;
      Initial: Boolean := False;
   end Randomize;
   
   protected Printer is 
      procedure Print(S: in String);
   end Printer;
end Tools;
