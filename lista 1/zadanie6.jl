function f(x::Float64)
  sqrt((x^2)+1) - 1  
end

function g(x::Float64)
  (x^2) / (sqrt((x^2)+1) + 1)  
end

global i = 1.0
global j = 0
while i > 0
  println("$j & $i & $(f(i)) & $(g(i)) \\\\")
  global i /= 8
  global j += 1
end