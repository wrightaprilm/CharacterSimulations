library(phangorn)
library(ape)
a<-list.files(pattern=".nex")
for (x in a){
  f <- read.csv(x)
  f2<-as.matrix(f)
  p2<-phyDat(f2,type="USER",levels=c(0,1)) 
  tree <- read.tree("/Users/aprilwright/Desktop/projectfiles/MorphSim/Trees/amph_tree.tre")
  c <- CI(tree,f)
  r <- RI(tree,data)

}
  