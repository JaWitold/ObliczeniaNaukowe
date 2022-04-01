function f(x)
  sin(x) + cos(3x)
end
function der_f(x)
  cos(x) - 3sin(3x)
end

function derivative(f::Function, x::Float64, h::Float64)
  (f(x+h) - f(x))/h
end

for i in 0:54
  h::Float64 = 2.0^(-i)
  println("$i & " ,derivative(f, 1.0, h), " & ", der_f(1.0), " & ", abs(derivative(f, 1.0, h) - der_f(1.0)), " \\\\")
end