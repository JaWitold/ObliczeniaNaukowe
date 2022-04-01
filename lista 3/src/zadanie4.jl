#Wiotld Karaś

include("module.jl")
using .lista3

delta = 0.5 * 10^(-5)
iter = 2^8

test = [
 mbisekcji(x -> sin(x) - (x/2)^2, 1.5, 2.0, delta, delta),
 mstycznych(x -> sin(x) - (x/2)^2, x -> cos(x) - 0.5x, 1.5, delta, delta, iter),
 msiecznych(x -> sin(x) - (x/2)^2, 1.0, 2.0, delta, delta, iter)
]

foreach(t -> println(join(t, " & "), " \\\\"), test)
