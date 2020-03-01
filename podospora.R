system("./slim podospora.slim")
SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")

generations <- rownames(SLiMdata)
plot(generations, SLiMdata[,1], col="black" , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation changes")

colorList <- c("red", "blue", "purple")
for (i in 1:length(colorList)) {
  index <- i + 1
  lines(generations, SLiMdata[,index], col=colorList[i], type="l" , lwd=3)
}

legend(170, 0.95, c("No Mutations","V1 Mutations", "R Muations","V1R Muations"), fill=c("black","red","blue","purple"))
