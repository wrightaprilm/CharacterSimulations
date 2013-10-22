require(geiger)

##All characters
tree<-read.tree("/Users/aprilwright/Desktop/projectfiles/MorphSim/Trees/amph_tree.tre")
vec_make <- function(){
p <- rgamma(1000, .25, .1)
for (value in p){
  if (value > 10.00){
    p[value] <-  rgamma(1, .35, .1)
    return(p)
      }
  }  
}

do_sims <- function(){
  for (value in vec_make()){
  q<-list(rbind(c(-value, value), c(value, -value)))
  s<-sim.char(tree, q, model="discrete")
  return(s)
  }
}

col_chars <- function() {
g <- vec_make()  
i <- 1
het_trx <- data.frame(do_sims())
while (i <= 1000){
  het_trx[,i] <- cbind(do_sims())
  i <- i + 1
}
  colnames(het_trx) <- g
  return(het_trx)
}

write_out <- function() {
  txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/1000/1ks/"
  g <- vec_make()
  me <- mean(g)
  f3<-paste(txt, me, ".csv", sep="_") 
  write.table(col_chars(), row.names=T,col.names =T, file = f3, sep=",")
  }

