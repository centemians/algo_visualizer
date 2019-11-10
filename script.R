#Creating a data.frame
data <- data.frame("time" = c(0,0,0,0,0,0,0,0,0,0), "index" = c(1:10), "value" = c(90,30,5,7,3,5,0,20,15,29))

size = 10
data_array <- array(c(4,30,5,7,3,5,0,20,15,90))
time_passed = 1
ctr = 1
plot_list = list()

for(i in 1:size){
  for(k in 1:size-1){
    if(any(data_array[k] > data_array[k+1])){
      temp = data_array[k]
      data_array[k] = data_array[k+1]
      data_array[k+1] = temp
    }
    for(l in 1:size){
      data <- rbind(data,list(time_passed,l,data_array[l]))
    }
    df <- data[data$time == time_passed,]
    #p = barplot(df$value)
    p = ggplot(df,aes(x=index,value)) + geom_point(size=10)
    plot_list[[ctr]] = p
    ctr = ctr + 1
    time_passed = time_passed + 1
  }
  
}

for(i in 1:100){
  Sys.sleep(0.09)
  plot(plot_list[[i]],type = "h")
}





