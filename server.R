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
  #######################################################################################
  #                                 Network page                                        #
  #######################################################################################
  
  #--------------------------------------------------------------------------#
  #                          Read data                                       #
  #--------------------------------------------------------------------------#
  MisLinks <- data.table(read.csv('linkes.txt'))
  MisNodes <- data.table(read.csv('nodes.txt'))
  ceg_info <- data.table(read.csv('ceg_infok.txt', sep = '\t'))
  cegadatok <- data.table(read.csv('ceg_alapadatok.txt', sep = '\t'))
  
  #--------------------------------------------------------------------------#
  #                          Network                                         #
  #--------------------------------------------------------------------------#
  output$networkPlot <- renderForceNetwork({
    MyClickScript <- 'Shiny.onInputChange("selected_node",d.index)'

    
    forceNetwork(Links = MisLinks, Nodes = MisNodes,
                 Source = "source", Target = "target", zoom = T,
                 Value = "value", NodeID = "Name",Nodesize = 'size',fontSize = 15,
                 Group = "group", opacity = 1, arrows = T, clickAction = MyClickScript, bounded = F)

  })
  
  #--------------------------------------------------------------------------#
  #                          Data to plot                                    #
  #--------------------------------------------------------------------------#
  my_data <- reactive({
    return(ceg_info[ceg_info$ceg_id==input$selected_node, ])
  })
  
  #--------------------------------------------------------------------------#
  #                          Plot to network                                 #
  #--------------------------------------------------------------------------#
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
  
  
#######################################################################################
#                                 Céginfó page                                        #
#######################################################################################
  
  output$cegek <- renderUI({
    selectInput("valsztottceg", "Vállasz céget",selected = "", choices = cegadatok$Name )
  })
  
  selected_ceg_id <- reactive({
    return(cegadatok[Name==input$valsztottceg,]$id)
  })
  
  output$text_1 <- renderText("Az Adatok random generáltak")
  output$text_2 <- renderText(paste(input$valsztottceg, selected_ceg_id()))
  #output$text_3 <- renderText("cikkek")
  
  
}