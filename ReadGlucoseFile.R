rm(list=ls()) 
GL<-read.csv(file="/Users/.../.csv", header=FALSE,skip = 1, sep=",") # file path 
M1<-GL[[5]]  
M2<-GL[[6]] 
Rtype<-GL[[4]] 
ind<-which(!(Rtype %in% c(0,1))) 

time_stamp<-GL[[3]]     
time_num <- as.numeric(as.POSIXct(time_stamp, format="%m-%d-%Y  %I:%M %p"))  # date to numeric
time_num<-(time_num-time_num[1])/60  

if (length(ind)!=0) {
  N1<-M1[-ind]; time_num<-time_num[-ind]} else {
    N1<-M1} 
N2<-M2 
N2<-N2[!is.na(N2)] 
N1[is.na(N1)] <- N2 
Glucose <- N1 

loc<-seq(1, length(time_num), 60)
plot(time_num,Glucose,type="l", col="red",xlab='',ylab='Glucose',xaxt='n')  
axis(1, at = time_num[loc], las=2, labels=unique(time_stamp)[loc], cex.axis=0.45)
grid() 

