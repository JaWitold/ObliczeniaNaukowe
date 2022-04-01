#Wiotld Karaś

include("module.jl")
using .lista4

using Test
delta = 2^(-8)

x = [0.0, 1.0, 2.0, 3.0, 4.0]
y = [7.0, 0.0, -1.0, 4.0, 15.0]

@testset "task 1 tests" begin
  @test ilorazyRoznicowe(x, y) ≈ [7.0, -7.0, 3.0, 0.0, 0.0] atol=delta
end

@testset "task 2 tests" begin
  @test warNewton(x, ilorazyRoznicowe(x, y), 2.33333333) ≈ 0 atol=delta
  @test warNewton(x, ilorazyRoznicowe(x, y), 0.0) ≈ 7.0 atol=delta
end

@testset "task 3 tests" begin
  @test naturalna(x, ilorazyRoznicowe(x, y)) ≈ [7.0, -10.0, 3.0, 0.0, 0.0] atol=delta
end

function test_f1(x)
  return x^2
end

function test_f2(x)
  return 1/x
end

function test_f3(x)
  return sin(x)
end

function test_f4(x)
  return log(x)
end

rysujNnfx(test_f1, -20.0, 20.0, 10)
rysujNnfx(test_f2, 1.0, 20.0, 10)
rysujNnfx(test_f3, -20.0, 20.0, 10)
rysujNnfx(test_f4, 1.0, 20.0, 10)


