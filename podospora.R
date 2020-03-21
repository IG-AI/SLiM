setwd("~/SLiM")

V1Vintercation = 60

individuals = 5000 
invaders = 10
selfing = 0.9

pnormOn = 1
pnormsd = 0.15
pnormmaxfitness = 1

pnormList <- c(0, 0.25, 0.15, 0.1)
runs = length(pnormList)
SLiMdataVect <- vector("list", runs)

for (i in 1:runs) {
  if (i == 1) {
    system(paste0("./slim -d V1Vintercation=", V1Vintercation, " -d individuals=", individuals, " -d invaders=", invaders, " -d selfing=", selfing, " -d pnormOn=", pnormList[i], " -d pnormsd=", pnormList[i], " -d pnormmaxfitness=", pnormmaxfitness, " podospora.slim"))
  }
  else {
    system(paste0("./slim -d V1Vintercation=", V1Vintercation, " -d individuals=", individuals, " -d invaders=", invaders, " -d selfing=", selfing, " -d pnormOn=", pnormOn, " -d pnormsd=", pnormList[i], " -d pnormmaxfitness=", pnormmaxfitness, " podospora.slim"))
  }
  SLiMdata <- read.delim("mutCount.txt", header = TRUE, sep = ",", dec = ".")
  SLiMdataVect[[i]] <- SLiMdata
}

generations <- rownames(SLiMdataVect[[1]])
colorList <- c("black", "red", "blue", "purple")
par(mfrow=c(2,2))
for (i in 1:runs) {
  for (j in 1:length(colorList)) {
    if (i == 1) {
      if (j == 1) {
        plot(generations, SLiMdataVect[[i]][[j]], col=colorList[j] , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main="Mutation changes, pnorm - linear function", ylim=c(0,1))
      }
    }
    else {
      if (j == 1) {
        plot(generations, SLiMdataVect[[i]][[j]], col=colorList[j] , type="l" , lwd=3 , xlab="Generations" , ylab="Mutation Frequency", main=paste0("Mutation changes, pnorm - standard deviation = ", pnormList[i]), ylim=c(0,1))
      }
    }
    lines(generations, SLiMdataVect[[i]][[j]], col=colorList[j], type="l" , lwd=3)
  }
  legend(160, 0.99, c("V1R alleles","VR alleles", "V1r alleles","Vr alleles"), fill=colorList)
}