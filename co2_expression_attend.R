START_ID <- 88331
RANGE <- 300
library(lubridate) # 時間データ処理に使う関数はここSTART_ID <- 68267
png('co2expresion_attend.png', width = 500, height = 300, pointsize = 12, bg = 'white')
df <- read.csv("feeds.csv")
df1 <- df[df$entry_id > START_ID -1 & df$entry_id < START_ID + RANGE,1:3]
START_CO2 <- df1[1,3]
END_CO2 <- df1[RANGE,3]
START_TIME = as.POSIXct(df1[1,1], format = "%Y-%m-%dT%H:%M:%OS")
X <- c()
for (i in 1:RANGE) {
    time = as.POSIXct(df1[i,1], format = "%Y-%m-%dT%H:%M:%OS")
    X <- c(X,as.duration(interval(START_TIME,time)))
}
Y1 <- df1$field1
cols <- c("black","green")
result=nls(Y1~A*(1-exp(-(k*X)))+END_CO2*(1-exp(-(k*X)))+START_CO2*(exp(-(k*X))),start=list(A=300,k=20/60000))
result
plot(X,Y1,type="l",col=cols[1],xlim=c(1,X[RANGE]),ylim=c(START_CO2 - 20,END_CO2 + 30),xlab="経過時間[s]",ylab="co2[ppm]")
par(new=T)
plot(X,predict(result),type='l',col=cols[2],xlim=c(1,X[RANGE]),ylim=c(START_CO2 - 20,END_CO2 + 30),xlab="",ylab="")
legend("bottomright",legend = c("測定データ","推定した値を代入した式"),col = cols,lty = c(1,1))
graphics.off()
START_CO2
END_CO2
