type = Float64

function check_one()
  x = nextfloat(one(type))
  while x < 2.0
    if x * (one(type)/x) != one(type)
      return x 
    else
      x = nextfloat(x)
    end 
  end  
end

println(check_one())