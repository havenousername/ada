package body Lines is

      procedure Hiext( S: in out Queue; E: in Elem ) is
      begin
         if S.Putter = S.Max then
           S.Adatok(S.Putter) := E; 
           return;
          end if;
     
          S.Adatok(S.Putter) := E;
          S.Putter := S.Putter + 1; 
          S.Size := S.Size + 1;
      end;

      procedure Lopop( S: in out Queue; E: out Elem ) is
      begin
          E := Lov(S);
          S.Size := S.Size - 1;
          S.Putter := S.Putter - 1;
      end;

      function Lov( S: Queue ) return Elem is
      begin
          return S.Adatok(S.Getter);
      end;

      function Is_Empty( S: Queue ) return Boolean is
      begin
          return Size(S) = 0;
      end;

      function Is_Full( S: Queue ) return Boolean is
      begin
          return Size(S) = S.Max;
      end;

      function Size( S: Queue ) return Natural is
      begin
          return S.Size;
      end;

end Lines;
