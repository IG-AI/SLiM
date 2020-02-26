runs = 5
dataVector <- vector("list", runs)
for(i in 1:runs) {
  system("slim podospora.slim")
  SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")
  dataVector[[i]] <- SLiMdata
}

averageMutationFrequency <- aaply(laply(dataVector, as.matrix), c(2, 3), mean)
minMutationFrequency <- aaply(laply(dataVector, as.matrix), c(2, 3), min)
maxMutationFrequency <- aaply(laply(dataVector, as.matrix), c(2, 3), max)

plot(averageMutationFrequency[,1], averageMutationFrequency[,2], col="black" , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation change")
lines(averageMutationFrequency[,1], minMutationFrequency[,2], col="black", type="l" , lwd=1)
lines(averageMutationFrequency[,1], maxMutationFrequency[,2], col="black", type="l" , lwd=1)

lines(averageMutationFrequency[,1], averageMutationFrequency[,3], col="red", type="l" , lwd=3)
lines(averageMutationFrequency[,1], minMutationFrequency[,3], col="red", type="l" , lwd=1)
lines(averageMutationFrequency[,1], maxMutationFrequency[,3], col="red", type="l" , lwd=1)

lines(averageMutationFrequency[,1], averageMutationFrequency[,4], col="blue", type="l" , lwd=3)
lines(averageMutationFrequency[,1], minMutationFrequency[,4], col="blue", type="l" , lwd=1)
lines(averageMutationFrequency[,1], maxMutationFrequency[,4], col="blue", type="l" , lwd=1)

lines(averageMutationFrequency[,1], averageMutationFrequency[,5], col="purple", type="l" , lwd=3)
lines(averageMutationFrequency[,1], minMutationFrequency[,5], col="purple", type="l" , lwd=1)
lines(averageMutationFrequency[,1], maxMutationFrequency[,5], col="purple", type="l" , lwd=1)

legend(80, 0.95, c("No Mutations","V1 Mutations","R Muations","V1R Muations"), fill=c("black","red","blue","purple"))
