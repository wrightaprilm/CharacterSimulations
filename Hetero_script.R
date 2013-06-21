require(geiger)

##All characters
tree<-read.tree("/Users/aprilwright/Desktop/projectfiles/MorphSim/Trees/amph_tree.tre")
vec_make <- function(){
p <- rgamma(350, .5, .1)
for (value in p){
  if (value >= 10){
    p[value] <-  rgamma(1, .35, .1)
    return(p)
      }
  }  
}

do_sims <- function(){
  for (value in vec_make()){
  q<-list(rbind(c(-value, value), c(value, -value)))
  s<-sim.char(tree, q, nsims = 1, model="discrete", root.state=1 )
  return(s)
  }
}

col_chars <- function() {
i <- 1
het_trx <- data.frame(do_sims())
while (i <= 350){
  het_trx[,i] <- cbind(do_sims())
  i <- i + 1
}
  colnames(het_trx) <- p
  return(het_trx)
}

write_out <- function() {
  txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/full/All/f/"
  g <- vec_make()
  mi <- min(g)
  me <- mean(g)
  ma <- max(g)
  f3<-paste(txt, mi, me, ma, ".csv", sep="_") 
  write.table(col_chars(), row.names=T,col.names =F, file = f3, sep=",")
  }

