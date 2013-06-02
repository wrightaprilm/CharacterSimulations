a<-list.files()
for (x in a){
get_file<-function(file){
 f<-read.csv(x,header=F, stringsAsFactors = FALSE)
  return(f)
  return(x)
  }


strip_name<-function(f){
  name <- substr(a,0,nchar(a)-4)
  p<-strsplit(name, "_")
  firsts<-unlist(lapply(p, "[", 2))
  seconds<-unlist(lapply(p, "[", 3))
  thirds<-unlist(lapply(p, "[", 4))
  combined<-cbind(firsts,seconds,thirds)
  max_val<-apply(combined, 1, which.max) 
  return(max_val)
}

manip_mat<-function(f){
  c<-ncol(f)
  for(i in strip_name(max_val)){
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
    return(sub_trix)
    return(other_trix)
  }
} 


delete_items<-function(sub_trix){
  c_sub<-ncol(sub_trix)
  r_sub<-nrow(sub_trix)
  total<-r_sub*c_sub
  del=total*.75
  h<-0
  while (h<del){
    new_sub <- sub_trix
    c<-ncol(sub_trix)-1
    r<-nrow(sub_trix)-1
    rcol<-sample(2:c, 1, replace=T)
    rrow<-sample(2:r, 1, replace=T)
    plusrow<-rrow
    pluscol<-rcol
    rando<-sample(1:100, 1, replace=T)
    randoc<-sample(1:100, 1, replace=T)
    if(rcol<c && rrow<r) {new_sub[rrow,rcol]<- "?"
    }
    if (rando > 50) {prrow<-sample(1:plusrow, 1, replace=T)
                     randoc<-sample(1:100, 1, replace=T)}
    if (randoc > 50){prcol<-sample(1:pluscol, 1, replace=T)}
    if(pluscol<c) {new_sub[rrow,pluscol]<- "?"
    }
    if(plusrow<r) {new_sub[rrow,rcol]<- "?"
    }
    h<-h+1
  }
  return(new_sub)
}

combi_matrix<-function(matrix1, matrix,x){
  new_trix<-cbind(matrix1, matrix)
  txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/75md/Fast/rando/f/"
  fi<-paste(txt, x,sep="")
  write.table(new_trix, row.names=F,col.names =F,file = fi, sep=",")
}

get_file(x)
manip_mat(f)
delete_items(sub_trix)
combi_matrix(sub_trix, other_trix, x)
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
    new_trix<-cbind(sub_trix,f[,116:c])
  } else if (g==2){
    new_trix<-cbind(f[,1:116],sub_trix,f[,231:c])
  } else if (g==3){
    new_trix<-cbind(f[,1:231],sub_trix,232)}
  
  
  txt<-"/Users/aprilwright/Desktop/projectfiles/MorphSim/NexusFiles/charfull/het/10md/Slow/row-wise/f/"
  fi<-paste(txt, x,sep="")
  write.table(new_trix, row.names=F,col.names =F,file = fi, sep=",")  
  
  