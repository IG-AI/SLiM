runs = 5
dataVector <- vector("list", runs)
for(i in 1:runs) {
  system("./slim podospora.slim")
  SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")
  dataVector[[i]] <- SLiMdata
}
averageMutationFrequency <- aaply(laply(dataVector, as.matrix), c(2, 3), mean)
plot(averageMutationFrequency[,1], averageMutationFrequency[,2], col="black" , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation change")
lines(averageMutationFrequency[,1], averageMutationFrequency[,3], col="red")
lines(averageMutationFrequency[,1], averageMutationFrequency[,4], col="blue")
lines(averageMutationFrequency[,1], averageMutationFrequency[,5], col="green")
legend(90, 0.95, c("No Mutations","V1 Mutations","R Muations","V1R Muations"), fill=c("black","red","blue","green"))