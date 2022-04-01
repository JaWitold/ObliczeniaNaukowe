floatTypes = [Float16, Float32, Float64]

function find_machine_epsilon(type::Type)
    epsilon = one(type)
    while one(type) + epsilon / 2 > one(type)
        epsilon /= 2
    end
    epsilon
end

function find_machine_eta(type::Type)
    eta = one(type)
    while eta / 2 > zero(type)
        eta /= 2
    end
    eta
end

#obliczanie w ten sposób ma związek z zapisem float'a w IEEE 754
function find_machine_max(type::Type)
    max = prevfloat(type(1.0))
    while !isinf(2*max)
        max *= 2
    end
    max
end

println("EPSILON: ")

foreach(type -> 
    println(
        type, " & ",
        find_machine_epsilon(type), " & ",
        eps(type) , " \\\\"
    ), 
    floatTypes
)

println("ETA: ")

foreach(type -> 
    println(
        type, " & ",
        find_machine_eta(type), " & ",
        floatmin(type) , " & ",
        nextfloat(type(0.0)) , " \\\\"
    ), 
    floatTypes
)

println("MAX: ")

foreach(type -> 
println(
    type, " & ",
    find_machine_max(type), " & ",
    floatmax(type) , " \\\\"
), 
    floatTypes
)


