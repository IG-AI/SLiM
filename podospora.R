setwd("~/SLiM")

V1Vintercation = 60
individuals = 1000
invaders = 10
selfing = 0.9

system(paste0("./slim -d V1Vintercation=", V1Vintercation, " -d individuals=", individuals, " -d invaders=", invaders, " -d selfing=", selfing, " podospora.slim"))
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

legend(170, 0.95, c("V1R alleles","VR alleles", "V1r alleles","Vr alleles"), fill=colorList)
