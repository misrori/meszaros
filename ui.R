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
           div(plotlyOutput("summary_plot", height = "350"), align = "center"),
           forceNetworkOutput('networkPlot')
             ),
  
  tabPanel("Cég információk",
           sidebarLayout(
             sidebarPanel(
               uiOutput("cegek")
             ),
             mainPanel(
               DT::dataTableOutput('ceginformaciok'),
               br(),
               br(),
               plotlyOutput("summary_plot2")
               #textOutput("text_2")
             )
           )
  ),
  
  tabPanel("Cikkek",

           includeHTML("proba.html")
  ),
  tabPanel("Money",
           
           textOutput('my_timer'),
           plotlyOutput("my_money_plotom")
  ),
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  )# http://bootswatch.com/#Grafikon_tab

)#nav