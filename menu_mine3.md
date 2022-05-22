# Calling R
R code can be called by using `R"..."`:
```julia:./test5.jl
using RCall
theme(:ggplot2) #HIDE

R"USmacro <- read.table('./_assets/USmacro.txt',
                         header = TRUE, dec = ',')"

USmacro = @rget USmacro #HIDE
first(USmacro, 5)
println(first(USmacro[:,1:7], 5)) #HIDE
```
\output{./test5.jl}

There is a little bit of hidden julia code here to make this possible though. We simply need to use the `@rget` macro to get the value from R to Julia.

```julia:./test6.jl
USmacro = @rget USmacro
```
\output{./test6.jl}
