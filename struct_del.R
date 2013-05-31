#_____ evolving, random: 
  a<-list.files()
  for (x in a) {
    f<-read.csv(x,header=F)
    name <- substr(a,0,nchar(a)-4)
    p<-strsplit(name, "_")
    for(value in p){
     b<- value[2]
     c<-value[3]
     d <-value[4]
     e<-c(b,c,d)
     g<- which.min(e)}
#     print(g)
    
    
    matrix <- as.matrix(f)
    c=ncol(matrix)
    if (ncol(f)>=231){
    if (g==1) {
    sub_trix<- f[,1:115]    
    } else if (g==2) {
      sub_trix<-f[,116:231]
    } else {
      sub_trix<-f[,231:c]
    }  }
    else{
      next
    }
#    print(sub_trix) 
  
    c=ncol(sub_trix)
    r=nrow(sub_trix)
    total=r*c
    del=total*.1
    i<-0
    while (i<del){
      c=ncol(sub_trix)-1
      r=nrow(sub_trix)-1
      rcol<-sample(2:c, 1, replace=T)
      rrow<-sample(2:r, 1, replace=T)
      plusrow<-rrow
      pluscol<-rcol
      rando<-sample(1:100, 1, replace=T)
      randoc<-sample(1:100, 1, replace=T)
      if(rcol<c && rrow<r) {sub_trix[rrow,rcol]<- "?"
      }
      if (rando > 50) {prrow<-sample(1:plusrow, 1, replace=T)
      randoc<-sample(1:100, 1, replace=T)}
      if (randoc > 50)
      {prcol<-sample(1:pluscol, 1, replace=T)}
      if(pluscol<c) {sub_trix[rrow,pluscol]<- "?"
      }
      if(plusrow<r) {sub_trix[rrow,rcol]<- "?"
      }
      i<-i+1}}
      if(g==1){
        new_trix<-data.frame(sub_trix,matrix[,116:c])
      } else if (g==2){
        new_trix<-data.frame(matrix[,1:116],sub_trix,matrix[,231:c])
      } else if (g==3){
        new_trix<-data.frame(matrix[,1:231],sub_trix,232)}
      
    
    txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/10md/Slow/rando/v/"
    fi<-paste(txt, x,sep="")
    write.table(new_trix, row.names=T,col.names =F,file = fi, sep=",")
        }  
    
________row-wise
  a<-list.files()
  for (x in a) {
    f<-read.csv(x,header=F)
    name <- substr(a,0,nchar(a)-4)
    p<-strsplit(name, "_")
    for(value in p){
      b<- value[2]
      c<-value[3]
      d <-value[4]
      e<-c(b,c,d)
      g<- which.min(e)}
    #     print(g)
    
    
    matrix <- as.matrix(f)
    c=ncol(matrix)
    if (ncol(f)>=231){
      if (g==1) {
        sub_trix<- f[,1:115]    
      } else if (g==2) {
        sub_trix<-f[,116:231]
      } else {
        sub_trix<-f[,231:c]
      }  }
    else{
      next
    }
    #    print(sub_trix) 
    
    c=ncol(sub_trix)
    r=nrow(sub_trix)
    total=r*c
    del=total*.1
    i<-0
    while (i<del){
      c=ncol(sub_trix)-1
      r=nrow(sub_trix)-1
      rcol<-sample(2:c, 1, replace=T)
      rrow<-sample(2:r, 1, replace=T)
      plusrow<-rrow
      pluscol<-rcol
      rando<-sample(1:100, 1, replace=T)
      randoc<-sample(1:100, 1, replace=T)
      plusrow<-rrow
      sub_trix[rrow,rcol]<- "?"
      rando<-sample(1:100, 1, replace=T)
      if (rando > 50) {prrow<-sample(1:plusrow, 1, replace=T)
                       randoc <-sample(1:71, 1, replace=T)}
      i<-i+1}
  if(g==1){
    new_trix<-data.frame(sub_trix,f[,116:c])
  } else if (g==2){
    new_trix<-data.frame(f[,1:116],sub_trix,f[,231:c])
  } else if (g==3){
    new_trix<-data.frame(f[,1:231],sub_trix,232)}
  
  
  txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/10md/Slow/row-wise/pi/"
  fi<-paste(txt, x,sep="")
  write.table(new_trix, row.names=F,col.names =F,file = fi, sep=",")  
  }
  