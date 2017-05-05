server <-function(input, output, session) {
    
    vals <- reactiveValues(counter = 0)
    output$my_timer <- renderText({
      
      invalidateLater(millis = 1000, session)
      vals$counter <- isolate(vals$counter) + 1
      return(paste('the number', vals$counter))
     
    })
    
  }

ui <- fluidPage(
    
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        sliderInput("bins",
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        textOutput("my_timer")
      )
    )
  )

shinyApp(ui = ui, server = server)


