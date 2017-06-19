library("ggplot2")
library("reshape")

getData <- function (n,maxp)  {
return(sapply(1:maxp, function(p) 2^(-p-n*(p-1)) * factorial(p)));
}



plotThis <- function () {
  size = 100
  a1 = getData(1,size);
  a2 = getData(2,size);
  a3 = getData(4,size);
  a4 = getData(8,size);
  d = data.frame(ix=1:size,a1,a2,a3,a4);
  melted = melt(d, id.vars="ix");
  ggplot(data=melted, aes(x=ix, y=value, color=variable)) + geom_point() + ylim(-10,10);
  ggsave("plot.pdf") 
}

plotThis()
