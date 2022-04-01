#Wiotld Karaś

include("module.jl")
using .lista3

delta = 10^(-5)
epsilon = delta
iter = 64
f1 = x -> exp(1 - x) - 1
pf1 = x -> -exp(1 - x)

f2 = x -> x * exp(-x)
pf2 = x -> (x - 1) * -exp(-x) 


test_f1 = [
  [
    string("mbisekcji && f1 && ", mbisekcji(f1, 0.5, 1.5, delta, epsilon)),
    string("mbisekcji && f1 && ", mbisekcji(f1, -5.0, 15.0, delta, epsilon)),
    string("mbisekcji && f1 && ", mbisekcji(f1, -15.0,  25.0, delta, epsilon))
  ],
  [
    string("mstycznych && f1 && ", mstycznych(f1, pf1, 1.0, delta, epsilon, iter)),
    string("mstycznych && f1 && ", mstycznych(f1, pf1, 1.5, delta, epsilon, iter)),
    string("mstycznych && f1 && ", mstycznych(f1, pf1, 2.5, delta, epsilon, iter))
  ],
  [
    string("msiecznych && f1 && ", msiecznych(f1, 0.5, -1.0, delta, epsilon, iter)),
    string("msiecznych && f1 && ", msiecznych(f1, -5.0, 5.0, delta, epsilon, iter)),
    string("msiecznych && f1 && ", msiecznych(f1, -5.0, 25.0, delta, epsilon, iter))
  ]
]

test_f2 = [
  [
    string("mbisekcji && f2 && ", mbisekcji(f2, -0.5, 1.0, delta, epsilon)),
    string("mbisekcji && f2 && ", mbisekcji(f2, -2.0, 15.0, delta, epsilon)),
    string("mbisekcji && f2 && ", mbisekcji(f2, -1.0, 25.0, delta, epsilon))
  ],
  [
    string("mstycznych && f2 && ", mstycznych(f2, pf2, 0.1, delta, epsilon, iter)),
    string("mstycznych && f2 && ", mstycznych(f2, pf2, 0.5, delta, epsilon, iter)),
    string("mstycznych && f2 && ", mstycznych(f2, pf2, 1.1, delta, epsilon, iter))
  ],
  [
    string("msiecznych && f2 && ", msiecznych(f2, -1.0, 0.5, delta, epsilon, iter)),
    string("msiecznych && f2 && ", msiecznych(f2, -5.0, 5.0, delta, epsilon, iter)),
    string("msiecznych && f2 && ", msiecznych(f2, -5.0, 25.0, delta, epsilon, iter))
  ]
]

test = [
  test_f1,
  test_f2
]

foreach(b -> 
  foreach(a -> 
    foreach(t -> 
      println(t, " \\\\")
    , a)
  , b)
, test)


println("\n")
println("mstycznych & f1 & 2.0 & ", mstycznych(f1, pf1, 2.0, delta, epsilon, iter), "\\\\")
println("mstycznych & f1 & 4.0 & ", mstycznych(f1, pf1, 4.0, delta, epsilon, iter), "\\\\")
println("mstycznych & f1 & 8.0 & ", mstycznych(f1, pf1, 8.0, delta, epsilon, iter), "\\\\")

println("mstycznych & f2 & 2.0 & ", mstycznych(f2, pf2, 2.0, delta, epsilon, iter), "\\\\")
println("mstycznych & f2 & 4.0 & ", mstycznych(f2, pf2, 4.0, delta, epsilon, iter), "\\\\")
println("mstycznych & f2 & 8.0 & ", mstycznych(f2, pf2, 8.0, delta, epsilon, iter), "\\\\")

println("mstycznych & f2 & 1.0 & ", mstycznych(f2, pf2, 1.0, delta, epsilon, iter), "\\\\")


