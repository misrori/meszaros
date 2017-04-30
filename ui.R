library(shiny)
library(plotly)
library(DT)
library(data.table)
library(rio)
library(d3Network)

navbarPage(
           title="Mészáros Lőrinc",
           tabPanel("Hálózat",
                    htmlOutput('networkPlot')
                    #textOutput("text_1")
                      
                    
                    
           ),
           tabPanel("Cég információk",
                    textOutput("text_2")
           ),
           tabPanel("Cikkek",
                    textOutput("text_3")
           ),
           tags$head(
             tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
           ),# http://bootswatch.com/#Grafikon_tab
           tags$head(
             tags$script(src = 'd3_network.js')
           )
           
           
           )#nav
