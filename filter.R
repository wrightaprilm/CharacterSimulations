  a <- list.files(pattern = ".csv")
  for (x in a) {
    T1 <- read.csv(x,header=FALSE, row.names = 1)
    f <- as.matrix(T1) 
  means <- apply(f, 2, mean)
  root_invar <- (f[, means == 1])
  tip_invar <- (f[, means == 2])
  sums <- colSums(f)
  root_non_pi <- (f[, sums == 76])
  tip_non_pi <- (f[, sums == 149])
  root_col <- colnames(root_invar)
  tip_col <- colnames(tip_invar)
  root_np_col <- colnames(root_non_pi)
  tip_np_col <- colnames(tip_non_pi)
    
  minus_pi <- f[ , !(colnames(f) %in% root_col)]
  minus_pi <- minus_pi[ , !(colnames(minus_pi) %in% tip_col)]
  minus_pi <- minus_pi[ , !(colnames(minus_pi) %in% root_np_col)]
  minus_pi <- minus_pi[ , !(colnames(minus_pi) %in% tip_np_col)]
  ending <- ".csv1"
  txt <- "/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/1000/"
  fi <- paste(txt, x, ending, sep="")
  write.table(f, row.names=TRUE,col.names =F,file = fi, sep=",")
}
