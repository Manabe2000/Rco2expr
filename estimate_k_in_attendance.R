args1 = commandArgs(trailingOnly=TRUE)[1] #1番目の引数を取得する
args2 = commandArgs(trailingOnly=TRUE)[2] #2番目の引数を取得する
START_TIME = as.POSIXct(args1, format = "%Y-%m-%dT%H:%M")
END_TIME = as.POSIXct(args2, format = "%Y-%m-%dT%H:%M")
library(lubridate) # 時間データ処理に使う関数はここ
pic_str = paste0("graph",substr(args1,1,4),substr(args1,6,7),paste(substr(args1,9,10),substr(args1,12,13),sep = "_") ,substr(args1,15,16),'.png')
png(pic_str, width = 500, height = 300, pointsize = 12, bg = 'white')
df <- read.csv("../feeds.csv")
df$created_at <- as.POSIXct(df$created_at, format = "%Y-%m-%dT%H:%M:%OS")
df1 <- df[df$created_at > START_TIME & df$created_at < END_TIME,1:3]
RANGE <- nrow(df1)
START_CO2 <- df1[1,3]
END_CO2 <- df1[RANGE,3]
X <- c()
for (i in 1:RANGE) {
    X <- c(X,as.duration(interval(df1[1,1],df1[i,1])))
}
Y1 <- df1$field1
cols <- c("black","green")
result=nls(Y1~A*(1-exp(-(k*X)))+START_CO2*(1-exp(-(k*X)))+START_CO2*(exp(-(k*X))),start=list(A=300,k=20/60000))
sink("result.csv",append=T)
paste(pic_str,coef(result)[1],coef(result)[2],coef(result)[1]/coef(result)[2],START_CO2,as.numeric(as.duration(interval(df1[1,1],df1[RANGE,1])),"seconds"),sep=",")
sink()
plot(X,Y1,type="l",col=cols[1],xlim=c(1,X[RANGE]),ylim=c(300,1000),xlab="経過時間[s]",ylab="co2[ppm]")
par(new=T)
plot(X,predict(result),type='l',col=cols[2],xlim=c(1,X[RANGE]),ylim=c(300,1000),xlab="",ylab="")
legend("bottomright",legend = c("測定データ","推定した値を代入した式"),col = cols,lty = c(1,1))
graphics.off()