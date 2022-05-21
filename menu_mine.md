@def title = "nice plots"
@def lang = "julia"

# Here are some nice Plots.

```julia:./exdot.jl
using LinearAlgebra
a = [1, 2, 3, 3, 4, 5, 2, 2]
@show dot(a, a)
println(dot(a, a)) 
```

**You can now show what this would look like:**

\output{./exdot.jl}

```julia:./test.jl
import Pkg; Pkg.add("Plots") #HIDE
using Plots, DataFrames      #HIDE

seq = 0:0.01:10
vect = collect(seq)
form4(x) = 30 * sin(x + 0.39) + 25
erg_form4 = zeros(1001)

for i in 1:length(vect)
    erg_form4[i] = form4(vect[i])
end

println(round.(first(erg_form4, 5), digits = 2)) #HIDE
```
**this gives:**
\output{./test.jl}

```julia:./test2.jl
theme(:ggplot2)
p = plot(seq, erg_form4, size = (700,500))
savefig(p, "plot.svg")
```
\output{./test2.jl}

**lets see:**

\fig{/plot.svg}

```julia:./test3.jl
m = 100
seq = 0:0.01:10
form1(x) = m * exp(-0.5x) + 5
form2(x) = m * 0.011x^2 - 5
form3(x) = 15 * abs(x - 4.37)
form4(x) = 30 * sin(x + 0.39) + 25
```

```julia:./test4.jl 
theme(:ggplot2) #hide
p1 = plot(seq, form1)   #hide
plot!(seq, form2, seriestype = :line) #hide 
plot!(seq, form3, seriestype = :line) #hide
plot!(seq, form4) #hide
plot!(annotate = (4.26, 27, "nice"), #hide
      annotationfontsize = 15, #hide
	  annotationcolor = "grey", #hide
	  annotationfontfamily = ("Courier"))#hide
savefig(p1, "plot1.svg")#hide
```
**nice Plot from above formulas:**

\fig{/plot1.svg}



