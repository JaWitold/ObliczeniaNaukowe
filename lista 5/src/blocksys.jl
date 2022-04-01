#Wiotld Karaś
module blocksys
  export solveWithGauss, rightSides
  using SparseArrays

  function solveWithGauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
  counter = 0

    for k in 1 : n - 1
      for i in k + 1 : min(n, k + l + 1) #OPTYMALIZACJA
        L = A[i, k] / A[k, k]
        for j in k + 1 : min(n, k + l + 1) #OPTYMALIZACJA
          A[i, j] -= L * A[k, j]
          counter += 1
        end
      b[i] -= L * b[k]
    	end
  	end
    x = zeros(Float64, n)
    for i in n:-1:1
      x_i = 0
      for j in i + 1 : min(n, i + l)
        x_i += A[i, j] * x[j]
        counter += 1
      end
      x[i] = (b[i] - x_i) / A[i, i]
    end
    println(counter)
    return x
  end

  function rightSides(M::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
    b = zeros(Float64, n)
    #Rozważamy tylko podmacierze A, B i C, stąd min
    for row in 1 : n
    	for col in max(1, row - l - 2) : min(n, row + l)
        b[row] += M[row, col]
      end
    end
  end
end




