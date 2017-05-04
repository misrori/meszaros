library(plotly)

p <- plot_ly(x = c(1, 2, 3), y = c(1, 2, 3)) %>%
  layout(images = list(
    list(source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
           xref = "paper",
           yref = "paper",
           x= 0,
           y= 1,
           sizex = 0.2,
           sizey = 0.2,
           opacity = 0.8
      ),
    list(source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
         xref = "paper2",
         yref = "paper2",
         x= 0.5,
         y= 1.1,
         sizex = 0.2,
         sizey = 0.2,
         opacity = 0.8
    )
    )
  )
p

my_money_plot <- function(teljes) {

  ax <- list(
    title = "",
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  p<- plot_ly(x = c(0,10), y = c(0,10)) %>%
    layout(xaxis = ax, yaxis = ax, images = teljes )
  return(p)
}
my_empty_plot2()





my_create_list <- function(my_length){
  teljes <- list()
  for(i in 1:my_length){
    temp <- list(source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
         xref = "paper",
         yref = "paper",
         x= runif(1),
         y= runif(1),
         sizex = 0.2,
         sizey = 0.2,
         opacity = 1
    )
    teljes[[i]] <- temp
  }
  return(teljes)
}

b <-my_create_list(100)


add_new_plot <- function(teljes){
  
  temp <- list(source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
               xref = "paper",
               yref = "paper",
               x= runif(1),
               y= runif(1),
               sizex = 0.2,
               sizey = 0.2,
               opacity = 1
  )
  teljes[[length(teljes)+1]] <- temp
  return(teljes)
}

teljes <- list()

teljes <- add_new_plot(teljes)



