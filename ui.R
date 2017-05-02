library(shiny)
library(plotly)
library(DT)
library(data.table)
library(rio)
library(networkD3)
library(igraph)

navbarPage(
  title="Mészáros Lőrinc",
  tabPanel("Hálózat",
           textOutput("text_1"),
           # conditionalPanel(
           # condition="input.selected_node !=0",
           # plotlyOutput('summary_plot')
           # ),
           plotlyOutput('summary_plot'),
           forceNetworkOutput('networkPlot')
  ),
  tabPanel("Cég információk",
           textOutput("text_2")
  ),
  tabPanel("Cikkek",

           includeHTML("proba.html")
  ),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  )# http://bootswatch.com/#Grafikon_tab

)#nav