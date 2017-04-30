library(shiny)
library(DT)
library(plotly)
library(data.table)
library(rio)
library(stringr)
library(pander)
library(d3Network)

function(input, output, session) {
  Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
  Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
  NetworkData <- data.frame(Source, Target)
  
 
  output$text_1 <- renderText("network")
  output$text_2 <- renderText("adatok")
  output$text_3 <- renderText("cikkek")
  
  output$networkPlot <- renderPrint({
    
    d3SimpleNetwork(NetworkData, width = 1200, height = 800)
    
  })
  
}