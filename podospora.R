runs = 10
dataVector <- vector("list", runs)
for(i in 1:runs) {
  system("./slim podospora.slim")
  SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")
  dataVector[[i]] <- SLiMdata
}
averageMutationFrequency <- aaply(laply(dataVector, as.matrix), c(2, 3), mean)
plot <- plot(averageMutationFrequency[,1], averageMutationFrequency[,2], col=rgb(0.2,0.1,0.5,0.9) , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation change")

