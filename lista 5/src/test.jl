#Witold Karaś
include("blocksys.jl")
include("iostream.jl")
using .blocksys
using .iostream

tests = [16, 10000, 50000, 100000]
# tests = [16]

for test in tests
  println(test)
  matrixFile = "./../input/Dane" * string(test) * "_1_1/A.txt"
  vectorFile = "./../input/Dane" * string(test) * "_1_1/b.txt"
  outFile = "./../out/Dane" * string(test) * "_1_1/out.txt"

  matrix, n, l = inputMatrix(matrixFile)
  vec = inputVector(vectorFile)
  x = solveWithGauss(matrix, vec, n, l)
  outputVector(outFile, x)

end