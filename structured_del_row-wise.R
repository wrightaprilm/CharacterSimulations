#_____ evolving, random: 
a<-list.files()
for (x in a){
    f<-read.csv(x,header=F)
    name <- substr(a,0,nchar(a)-4)
    p<-strsplit(name, "_")
    print(p)
    firsts<-unlist(lapply(p, "[", 2))
    seconds<-unlist(lapply(p, "[", 3))
    thirds<-unlist(lapply(p, "[", 4))
    combined<-cbind(firsts,seconds,thirds)
    min_val<-apply(combined, 1, which.min) 
    c<-ncol(f)
    for(i in min_val){
      if(c> 230){
      if(i == 1) {
        sub_trix <- f[,1:115]   
        other_trix <- f[,115:c]
      } 
      else if(i == 2) {
        sub_trix <- f[,116:231]      
        other_trix <- f[,1:116, 231:c]
      } 
      else {
        sub_trix<-f[,231:c]
        other_trix <- f[,1:231]
      }  
    }
    }
    print(sub_trix)
    c_sub<-ncol(sub_trix)
    r_sub<-nrow(sub_trix)
    total<-r_sub*c_sub
    del=total*.75
    while (i<del){
      c=ncol(sub_trix)
      r=nrow(sub_trix)
      rcol<-sample(2:c, 1, replace=T)
      rrow<-sample(2:r, 1, replace=T)
      plusrow<-rrow + 1
      sub_trix[[rrow,rcol]]<- "?"
      rando<-sample(1:100, 1, replace=T)
      if (rando > 50) {prrow<-sample(1:plusrow, 1, replace=T)
                       randoc <-sample(1:100, 1, replace=T)}
      sub_trix[[plusrow,rcol]]<- "?"
      
      i<-i+1
    }
  
    
    new_trix<-cbind(sub_trix[1:75,], other_trix)
    
    txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/75md/Slow/row-wise/f/"
    fi<-paste(txt, x,sep="")
    write.table(new_trix, row.names=F,col.names =F,file = fi, sep=",")
  }
  