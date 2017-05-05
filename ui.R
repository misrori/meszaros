library(shiny)
library(plotly)
library(DT)
library(data.table)
library(networkD3)

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
  
  tabPanel("Na de mennyit is keres a Mészáros?",
           br(),
           div(textOutput('my_timer'), align = "center"),
           div(plotlyOutput("my_money_plotom", height = "800", width = "1200"), align = "center")
  ),
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
  )# http://bootswatch.com/#Grafikon_tab

)#nav