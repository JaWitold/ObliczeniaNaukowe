# Witold Karaś
pxx = [-2.0 => 1, -2 => 2, -2 => 1.99999999999999, -1 => 1, -1 => -1, -1 => 0.75, -1 => 0.25]

function req(n::Int, c::Float64, x0::Float64):Float64
    for i in 1:n
      x0 = x0^2 + c
      println(i, "\t", x0)
    end
end

foreach(pair -> req(40, pair.first, pair.second), pxx)