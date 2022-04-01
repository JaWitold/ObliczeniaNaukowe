#Wiotld Karaś

include("module.jl")
using .lista4

function z6_f1(x)
  return abs(x)
end

function z6_f2(x)
  return 1/(1+x^2)
end

rysujNnfx(z6_f1, -1.0, 1.0, 5)
rysujNnfx(z6_f1, -1.0, 1.0, 10)
rysujNnfx(z6_f1, -1.0, 1.0, 15)

rysujNnfx(z6_f2, -5.0, 5.0, 5)
rysujNnfx(z6_f2, -5.0, 5.0, 10)
rysujNnfx(z6_f2, -5.0, 5.0, 15)
