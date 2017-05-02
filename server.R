library(shiny)
library(DT)
library(plotly)
library(data.table)
library(rio)
library(stringr)
library(pander)
library(networkD3)
library(igraph)
source('my_functions.R')
#network tutorial  http://christophergandrud.github.io/networkD3/

function(input, output, session) {
  MisLinks <- read.csv('linkes.txt')
  MisNodes <- read.csv('nodes.txt')
  ceg_info <- read.csv('ceg_infok.txt', sep = '\t')
  
  # Plot
  
  output$text_1 <- renderText("Az Adatok random generáltak")
  output$text_2 <- renderText("adatok")
  #output$text_3 <- renderText("cikkek")
  
  output$networkPlot <- renderForceNetwork({
    MyClickScript <- 'Shiny.onInputChange("selected_node",d.index)'

    
    forceNetwork(Links = MisLinks, Nodes = MisNodes,
                 Source = "source", Target = "target", zoom = T,
                 Value = "value", NodeID = "Name",Nodesize = 'size',fontSize = 15,
                 Group = "group", opacity = 1, arrows = T, clickAction = MyClickScript, bounded = F)

  })
  
  #output$text_3 <- renderText(paste('You have just clicked ',input$selected_node,'. I will return more information of ', input$selected_node, sep = '')) 
  my_data <- reactive({
    return(ceg_info[ceg_info$ceg_id==input$selected_node, ])
  })
  
  my_plot <- reactive({
    
    if(nrow(my_data())!=0){
      return(my_company_plot(adat = my_data()))
    }
    else{
      return(my_empty_plot())
      
    }
  })
  
  output$summary_plot <- renderPlotly({
    my_plot()
  })
  
}