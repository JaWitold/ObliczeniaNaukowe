#Wiotld Karaś

include("module.jl")
using .lista3

using Test

delta = 2^(-8)
iter = 2^8

@testset "task 1 tests" begin
  @test mbisekcji(x -> x^2 - 1, 0.0, 2.0, delta, delta)[1] ≈ 1.0 atol=delta
  @test mbisekcji(x -> x^3 - 1, 0.0, 2.0, delta, delta)[1] ≈ 1.0 atol=delta
  @test mbisekcji(x -> sin(x), 0.0, 2.0, delta, delta)[1] ≈ 0.0 atol=delta
end

@testset "task 2 tests" begin
  @test mstycznych(x -> x^2 - 1, x -> 2*x, 1.5, delta, delta, iter)[1] ≈ 1.0 atol=delta
  @test mstycznych(x -> x^3 - 1, x -> 3*x^2, 1.5, delta, delta, iter)[1] ≈ 1.0 atol=delta
  @test mstycznych(x -> sin(x), x -> cos(x), 1.0, delta, delta, iter)[1] ≈ 0.0 atol=delta
end

@testset "task 3 tests" begin
  @test msiecznych(x -> x^2 - 1, 0.0, 2.0, delta, delta, iter)[1] ≈ 1.0 atol=delta
  @test msiecznych(x -> x^3 - 1, 0.5, 1.5, delta, delta, iter)[1] ≈ 1.0 atol=delta
  @test msiecznych(x -> sin(x), 0.0, 2.0, delta, delta, iter)[1] ≈ 0.0 atol=delta
end



