# This file was generated, do not modify it. # hide
using Plots, DataFrames

seq = 0:0.01:10
vect = collect(seq)
form4(x) = 30 * sin(x + 0.39) + 25
erg_form4 = zeros(1001)

for i in 1:length(vect)
    erg_form4[i] = form4(vect[i])
end

@show round.(first(erg_form4, 5), digits = 2)
theme(:ggplot2)
p = plot(seq, erg_form4)
savefig(p, "plot.svg")