result <-read.csv("graph/result.csv")
png('scatter_plot_time_k.png', width = 500, height = 300, pointsize = 12, bg = 'white')
plot(result$DATA_RANGE,result$k,xlab="経過時間",ylab="換気係数")