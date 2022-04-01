type = Float64

function find_delta(a::type, b::type) 
  #a_sign = SubString(bitstring(a), 1:1)
  a_exponent = parse(Int, SubString(bitstring(a), 2:11); base = 2)
  b_exponent = parse(Int, SubString(bitstring(prevfloat(b)), 2:11); base = 2)
  #a_fraction = SubString(bitstring(a), 12:64)
  if(a_exponent != b_exponent)
    return -1
  end
  #sprawdzimy czy eksponent się nie zmienia - delta jest taka sama dla liczb z zakresu a:b
  Float64(nextfloat(a) - a)
end

ranges = [(0.5, 1.0), (1.0, 2.0), (2.0, 4.0)]

foreach(range -> println("$range & " , find_delta(range[1], range[2]) , " \\\\"), ranges)