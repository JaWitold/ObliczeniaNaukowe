# Witold Karaś
using LinearAlgebra

include("../resources/hilb.jl")
include("../resources/matcond.jl")

conditions = [1.0, 10.0, 10.0^3, 10.0^7, 10.0^12, 10.0^16]
n = [5, 10, 20]
hn = collect(1:2:30)

function test(A, n)
  x = ones(Float64, n)
  b = A*x
  gauss = norm((A \ b) - x)/norm(x)   
  inverse = norm(inv(A) * b - x)/norm(x)

  return string(rank(A), " & ", cond(A)," & ", gauss, " & ", inverse, " \\\\")
end

foreach(n_ -> println(n_ ," & ", test(hilb(n_), n_)), hn)
println("\n")
foreach(n_ -> foreach(condition -> println(n_ , " & ", condition, " & ", test(matcond(n_, Float64(condition)), n_)), conditions), n)
