with for_all;

procedure decode(S: in out String) is
   procedure letter_move_to_next(Ch: in out Character) is
   begin 
      Ch := Character'Succ(Character(Ch)); 
   end letter_move_to_next;
   
   procedure string_for_all is new for_all(Character, Positive, String, letter_move_to_next);
begin
   string_for_all(S);
end decode;
