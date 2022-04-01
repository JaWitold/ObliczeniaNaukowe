#Wiotld Karaś

module lista3
export mbisekcji, mstycznych, msiecznych
  #zadanie1
  function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    iter = 0;
    u = f(a)
    v = f(b)
    e = b - a
    if sign(u) == sign(v)
      return (nothing, nothing, nothing, 1)
    end
    
    while abs(e) >= delta
      iter += 1
      e = e/2
      c = a+e
      w = f(c)
      if abs(e) < delta || abs(w) < epsilon
        return (c, w, iter, 0)
      end

      if sign(w) != sign(u)
        b = c
        v = w
      else
        a = c
        u = w
      end
    end
  end

  #zadanie2
  function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    v = f(x0)
    if abs(v) < epsilon
      return (x0, v, 0, 0)
    end

    for iter = 1:maxit
      p = pf(x0)
      if abs(p) < epsilon
        return (nothing, nothing, nothing, 2)
      end

      x1 = x0 - v/p
      v = f(x1)
      if abs(x1 - x0) < delta || abs(v) < epsilon
        return (x1, v, iter, 0)
      end
      x0 = x1
    end
    return (nothing, nothing, nothing, 1)
  end

  #zadanie3
  function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64,
  maxit::Int)
    fa = f(x0)
    fb = f(x1)
    for k = 1:maxit
      if abs(fa) > abs(fb)
        temp = x0
        x0 = x1
        x1 = temp

        temp = fa
        fa = fb
        fb = temp
      end
      s = (x1 - x0)/(fb - fa)
      x1 = x0
      fb = fa
      x0 = x0 - fa*s
      fa = f(x0)
      if abs(x1 - x0) < delta || abs(fa) < epsilon
        return (x0, fa, k, 0)
      end
    end
    return (nothing, nothing, nothing, 1)
  end
end