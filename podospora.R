setwd("~/SLiM")
system("./slim podospora.slim")
SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")

generations <- rownames(SLiMdata)
colorList <- c("black", "red", "blue", "purple")
for (i in 1:length(colorList)) {
  if (i == 1) {
    plot(generations, SLiMdata[,i], col=colorList[i] , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation changes")
  }
  else {
    lines(generations, SLiMdata[,i], col=colorList[i], type="l" , lwd=3)
  }
}

legend(170, 0.95, c("No Mutations","V1 Mutations", "R Muations","V1R Muations"), fill=c("black","red","blue","purple"))
