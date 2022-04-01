#zadanie 2

floatTypes = [Float16, Float32, Float64]

function kahan_eps(type::Type)
  oneType = one(type)
  (3*oneType)*((4*oneType)/(3*oneType) - oneType) - oneType
end

foreach(type -> println(
  type, " & ",
  " " , kahan_eps(type), " \\\\ ",

), floatTypes)