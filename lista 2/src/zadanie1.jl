# Witold Karaś

x = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

n = length(x) == length(y) ? length(x) : nothing
types = [Float32, Float64]

function dp_v1(x::Vector, y::Vector, type::Type)
  sum::type = 0.0
  for i in 1:n
    sum += x[i]*y[i]
  end
  sum
end

function dp_v2(x::Vector, y::Vector, type::Type)
  sum::type = 0.0
  for i in n:-1:1
    sum += x[i]*y[i]
  end
  sum
end

function dp_v3(x::Vector, y::Vector, type::Type)
  Sum = zeros(type, 1, length(x))
  for i in 1:n
    Sum[i] += x[i]*y[i]
  end
  positives = []
  negatives = []
  foreach(s -> s > 0 ? append!(positives, s) : append!(negatives, s), Sum)
  positives = reverse(sort(positives))
  negatives = sort(negatives)
  #print("c): positives: $positives || negatives: $negatives\n")

  sum(positives) + sum(negatives)
end

function dp_v4(x::Vector, y::Vector, type::Type)
  Sum = zeros(type, 1, length(x))
  for i in 1:n
    Sum[i] += x[i]*y[i]
  end
  positives = []
  negatives = []
  foreach(s -> s > 0 ? append!(positives, s) : append!(negatives, s), Sum)
  positives = sort(positives)
  negatives = reverse(sort(negatives))
  #print("d): positives: $positives || negatives: $negatives\n")
  sum(positives) + sum(negatives)
end

functions = [dp_v1, dp_v2, dp_v3, dp_v4]
foreach(type -> foreach(fn -> println("$type & " , fn(map(X -> type(X), x), map(Y -> type(Y), y), type), " \\\\"), functions), types)
