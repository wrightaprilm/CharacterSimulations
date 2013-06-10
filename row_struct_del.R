a<-list.files(pattern=".csv")
for (x in a){
  f<-read.csv(x,header=F, row.names=1)
  
  
  name <- substr(a,0,nchar(a)-4)
  p<-strsplit(name, "_")
  firsts<-unlist(lapply(p, "[", 2))
  seconds<-unlist(lapply(p, "[", 3))
  thirds<-unlist(lapply(p, "[", 4))
  combined<-cbind(firsts,seconds,thirds)
  min_val<-apply(combined, 1, which.min)
  
  
  c<-ncol(f)
  for(i in min_val){
    if(i == 1) {
      g <- f[1:19,0:115]
      h <- f[20:75,0:length(f)]
      h < as.matrix(h)
      h[h == 1] <- "1"
      h[h == 2] <- "2"
      l <- f[1:19,116:length(f)]
      g <- as.matrix(g)
      g[g == 1 | 2] <- "?"
      j <- cbind(g,l)
      k<- rbind(j,h)
    }
    if(i == 2 | 3) {
      g <- f[1:19,231:length(f)]
      h <- f[20:75,0:length(f)]
      h < as.matrix(h)
      h[h == 1] <- "1"
      h[h == 2] <- "2"
      l <- f[1:19,0:230]
      g <- as.matrix(g)
      g[g == 1 | 2] <- "?"
      j <- cbind(g,l)
      k<- rbind(j,h)
 }      
  }  
  txt<-"/Users/aprilwright/Desktop/MorphSim/NexusFiles/charfull/het/full/All/upload/"
  fi<-paste(txt, x,sep="")
  write.table(k, row.names=T,col.names =F,file = x, sep=",")  
}