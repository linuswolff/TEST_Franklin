# This file was generated, do not modify it. # hide
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