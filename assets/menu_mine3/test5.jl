# This file was generated, do not modify it. # hide
using RCall

R"USmacro <- read.table('./_assets/USmacro.txt',
                         header = TRUE, dec = ',')"

USmacro = @rget USmacro #HIDE
first(USmacro, 5)
println(first(USmacro[:,1:7], 5)) #HIDE