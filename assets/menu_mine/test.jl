# This file was generated, do not modify it. # hide
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