#Wiotld Karaś

include("module.jl")
using .lista4

function z5_f1(x)
  return exp(x)
end

function z5_f2(x)
  return x^2*sin(x)
end

rysujNnfx(z5_f1, 0.0, 1.0, 5)
rysujNnfx(z5_f1, 0.0, 1.0, 10)
rysujNnfx(z5_f1, 0.0, 1.0, 15)

rysujNnfx(z5_f2, -1.0, 1.0, 5)
rysujNnfx(z5_f2, -1.0, 1.0, 10)
rysujNnfx(z5_f2, -1.0, 1.0, 15)