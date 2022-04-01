#Wiotld Karaś

include("module.jl")
using .lista3

delta = 10^(-4)
iter = 2^8
f = x -> 3x - exp(x)

test = [
 mbisekcji(f, 1.5, 2.0, delta, delta),
 mbisekcji(f, 0.5, 1.0, delta, delta),
]

foreach(t -> println(join(t, " & "), " \\\\"), test)



