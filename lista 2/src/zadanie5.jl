# Witold Karaś

function p(n, r, p_0)
  if n == 0 
    return p_0
  end
  pn = p(n-1, r, p_0)
  return pn + r*pn*(1 - pn)
end

function myTrunc(n, k = 3)
  return trunc(n*10^k)/10^k
end

p_0 = 0.01
r = 3.0

pp = myTrunc(p(10, Float32(r), Float32(p_0)))
pp = myTrunc(p(10, Float32(r), Float32(pp)))
pp = myTrunc(p(10, Float32(r), Float32(pp)))
pp = myTrunc(p(10, Float32(r), Float32(pp)))

pp2 = p(40, Float32(r), Float32(p_0))
println(pp, " & ", pp2, " \\\\")

pp3 = p(40, Float32(r), Float32(p_0))
pp4 = p(40, Float64(r), Float64(p_0))
println(pp3, " & ", pp4, " \\\\")

