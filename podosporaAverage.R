library(plyr)


runs = 10
dataVector <- vector("list", runs)
for(i in 1:runs) {
  system("./slim podospora.slim")
  SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")
  dataVector[[i]] <- SLiMdata
}

functionVarList <- c("mean", "min", "max", "sd")
extenedDataVector <- as.data.frame(aaply(laply(dataVector, as.matrix), c(2, 3), functionVarList))


# colorListPlot1 <- c(colorList <- c("black", "red", "purple"))
# colorListPlot2 <- c(colorList <- c("black", "blue", "purple"))
# 
# plot(as.name(varList[1])[,1], as.name(varList[1])[,2], col=colorListPlot1[1] , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="V1 Mutation change")
# for (i in 1:length(colorListPlot1)) {
#   for (j in 1:(length(varList) - 2)) { 
#     lines(as.name(varList[1])[,1], as.name(varList[i + 1])[,2], col=colorListPlot1[j], type="l" , lwd=1)
#   }
# }

generation <- rownames(extenedDataVector)

par(mfrow=c(2,1))

plot(generation, extenedDataVector$None_Mutation_Frequency.mean, col="black" , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="V1 Mutation change")
lines(generation, extenedDataVector$None_Mutation_Frequency.min, col="black", type="l" , lwd=1)
lines(generation, extenedDataVector$None_Mutation_Frequency.max, col="black", type="l" , lwd=1)
lines(generation, extenedDataVector$None_Mutation_Frequency.sd, col="black", type="l" , lwd=1)

lines(generation, extenedDataVector$V1_Mutation_Frequency.mean, col="red", type="l" , lwd=3)
lines(generation, extenedDataVector$V1_Mutation_Frequency.min, col="red", type="l" , lwd=1)
lines(generation, extenedDataVector$V1_Mutation_Frequency.max, col="red", type="l" , lwd=1)
#lines(generation, extenedDataVector$V1_Mutation_Frequency.sd, col="red", type="l" , lwd=1)

lines(generation, extenedDataVector$V1R_Mutation_Frequency.mean, col="purple", type="l" , lwd=3)
lines(generation, extenedDataVector$V1R_Mutation_Frequency.min, col="purple", type="l" , lwd=1)
lines(generation, extenedDataVector$V1R_Mutation_Frequency.max, col="purple", type="l" , lwd=1)
#lines(generation, extenedDataVector$V1R_Mutation_Frequency.sd, col="purple", type="l" , lwd=1)

legend(80, 0.95, c("No Mutations","V1 Mutations","V1R Muations"), fill=colorListPlot1)

plot(generation, extenedDataVector$None_Mutation_Frequency.mean, col="black" , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="R Mutation change")
lines(generation, extenedDataVector$None_Mutation_Frequency.min, col="black", type="l" , lwd=1)
lines(generation, extenedDataVector$None_Mutation_Frequency.max, col="black", type="l" , lwd=1)
lines(generation, extenedDataVector$None_Mutation_Frequency.sd, col="black", type="l" , lwd=1)

lines(generation, extenedDataVector$R_Mutation_Frequency.mean, col="blue", type="l" , lwd=3)
lines(generation, extenedDataVector$R_Mutation_Frequency.min, col="blue", type="l" , lwd=1)
lines(generation, extenedDataVector$R_Mutation_Frequency.max, col="blue", type="l" , lwd=1)
#lines(generation, extenedDataVector$R_Mutation_Frequency.sd, col="blue", type="l" , lwd=1)

lines(generation, extenedDataVector$V1R_Mutation_Frequency.mean, col="purple", type="l" , lwd=3)
lines(generation, extenedDataVector$V1R_Mutation_Frequency.min, col="purple", type="l" , lwd=1)
lines(generation, extenedDataVector$V1R_Mutation_Frequency.max, col="purple", type="l" , lwd=1)
#lines(generation, extenedDataVector$V1R_Mutation_Frequency.sd, col="purple", type="l" , lwd=1)

legend(80, 0.95, c("No Mutations","R Muations","V1R Muations"), fill=c("black","blue","purple"))

