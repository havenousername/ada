with gcd;

function lcm(A, B: Positive) return Positive is
begin
   return (A * B) / Gcd(A, B);
end lcm;
