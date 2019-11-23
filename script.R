#Creating a data.frame
data <- data.frame("time" = c(rep(0,35)), "index" = c(1:35), "value" = c(90,10,0,3,1,56,32,3,54,98,34,53,24,17,84,38,76,9,38,76,10,38,64,39,87,34,25,55,34,22,13,57,1,2,3))

size = 35
#data_array <- array(c(90,10,0,3,1,56,32,3,54,98,34,53,24,17,84,38,76,9,38,76,10,38,64,39,87,34,25,55,34,22,13,57,1,2,3))
time_passed = 1

df <- data.frame("time" = c(rep(1,35)), "index" = c(1:35), "value" = c(90,10,0,3,1,56,32,3,54,98,34,53,24,17,84,38,76,9,38,76,10,38,64,39,87,34,25,55,34,22,13,57,1,2,3))

for(i in 1:size){
  for(k in 1:size-1){
    if(any(df[k,3] > df[k+1,3])){
      temp = df[k,3]
      df[k,3] = df[k+1,3]
      df[k+1,3] = temp
    }
    df$time = time_passed
    data <- rbind(data,df)
    time_passed = time_passed + 1
  }
  
}

p_temp <-ggplot(data=data, aes(x=index, y=value, fill = index)) +
  geom_bar(stat="identity")

anim <- p_temp + gganimate::transition_states(time,transition_length = 1,state_length = 1)

movie3 <- animate(anim, renderer = ffmpeg_renderer(format = ".gif"))
b <- animate(anim,renderer = gifski_renderer(),nframes = 2000,fps=40)
anim_save("output.gif", b)

