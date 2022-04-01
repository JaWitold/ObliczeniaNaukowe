#Witold Karaś
module iostream
export inputMatrix, inputVector, outputVector

using SparseArrays
using DelimitedFiles

  function inputMatrix(fileName)
    file = open(fileName, "r")
    #READ HEADRER
    n, l = split(readline(file))
    n = parse(Int64, n)
    l = parse(Int64, l)

    #READ Matrix
    row = Int64[]
    col = Int64[]
    val = Float64[]

    for ln in eachline(file)
      r, c, v = split(ln)
      push!(row, parse(Int64, r))
      push!(col, parse(Int64, c))
      push!(val, parse(Float64, v))
    end
    close(file)
    
    return (sparse(row, col, val), n, l)
  end

  function inputVector(fileName::String)
    file = open(fileName, "r")
    #READ HEADRER
    n = parse(Int64, split(readline(file))[1])
    b = Array{Float64}(undef, n)
    
    for (index, ln) in enumerate(eachline(file))
      b[index] = parse(Float64, split(ln)[1])
    end
    close(file)

    return b
  end


  function outputVector(fileName::String, vector::Vector{Float64})
    writedlm(fileName, vector, "\n")
  end
end