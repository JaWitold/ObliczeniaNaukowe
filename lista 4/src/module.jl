#Wiotld Karaś
module lista4
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

  #zadanie 1
  function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    len = length(x);  #n + 1
    fx = Vector{Float64}(undef, len);
    
    #ilorazy różnicowe pierwszego rzędu
    for i in 1:len
      fx[i] = f[i];
    end    

    for i in 2:len
      for j = len:-1:i
        fx[j] = (fx[j] - fx[j - 1]) / (x[j] - x[j - i + 1])
      end
    end

    return fx
  end

  #zadanie 2
  function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    len = length(x);  #n + 1
    w = Vector{Float64}(undef, len);

    w[len] = fx[len]

    for k = len-1:-1:1 
      w[k] = fx[k] + (t - x[k]) * w[k + 1]
    end

    return w[1];
  end

  #zadanie 3
  function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    len = length(x);  #n + 1
    a = Vector{Float64}(undef, len);
    a[len] = fx[len];

    for i = len - 1:-1:1              # alg hornera
      a[i] = fx[i] - a[i + 1] * x[i]  # alg hornera
      for j = i + 1:len - 1             #wymnażamy kolejne współczynniki
          a[j] = a[j] - a[j + 1] * x[i] 
      end
    end
    return a;
  end

  using PyPlot

  #zadanie 4
  function rysujNnfx(f,a::Float64,b::Float64,n::Int)
    factor = 5;
    nodes = n + 1; #stopień wielomianu interpolacyjnego + 1
    h = (b - a)/n
    kh = 0.0;
    
    x = Vector{Float64}(undef, nodes)
    y = Vector{Float64}(undef, nodes)
    yN = Vector{Float64}(undef, nodes)

    plot_x = Vector{Float64}(undef, nodes * factor)
    plot_y = Vector{Float64}(undef, nodes * factor)
    plot_w = Vector{Float64}(undef, nodes * factor)

    #obliczny współrzędne (x,y) dla funkcji f w przedziale (a, b)
    for i = 1:nodes
      x[i] = a + kh;
      y[i] = f(x[i]);
      kh += h;
    end

    yN = ilorazyRoznicowe(x, y);
    kh = 0.0;
    nodes = nodes * factor
    h = abs(b - a)/(nodes - 1)

    for i = 1:nodes
      plot_x[i] = a + kh;
      plot_w[i] = warNewton(x, yN, plot_x[i]);
      plot_y[i] = f(plot_x[i]);
      kh += h;
    end
    clf()

    plot(plot_x, plot_y, color="orange", linewidth=1.0, label="f")
    plot(plot_x, plot_w, color="blue", linewidth=1.0, linestyle=":", label="w(x)")
    legend(loc=1)
    grid(true)
    title("plot $(f)(x)")
    savefig("./../img/plot_$(f)(x)_$(n).png")
  end
end