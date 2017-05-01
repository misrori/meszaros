library(shiny)
library(networkD3)

source =c(0,0,3,3,3,7,7,10,9,7,1,6,4,5,8,2)
target = c(1,2,4,5,6,8,9,11,12,10,9,10,8,9,11,8)
value = c(10,10,10,10,10,10,10,20,20,10,2,2,2,10,20,15)
MisLinks = data.frame(source,target,value)

name = c("[Category]Genre", "CCG", "Action",  "[Category]Art","Realistic Art", "Dark Art", "Cartoony", "[Category]Time  demend", "Mid-Core", "Hard-Core", "Casual", "Install", "Not Install")
group = c(1,2,2,3,4,4,4,5,6,6,6,8,8)
size = c(50,20,20,50,20,20,20,50,20,20,20,250,250)
hyperlink = c("http://google.com", "http://yahoo.com", "http://google.com", "http://yahoo.com", "http://google.com", "http://yahoo.com", "http://google.com", "http://yahoo.com", "http://google.com", "http://yahoo.com", "http://google.com", "http://yahoo.com", "http://yahoo.com")
MisNodes = data.frame(name, group, size, hyperlink)

ui = fluidPage(
  titlePanel("Testing app"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("opacity", "Test", 0.6, min = 0.1, max = 1, step = .1)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Force Network", forceNetworkOutput("force"))
      )
    )
  )
)

Myclickaction = "window.open(d.hyperlink, '_blank')"

server = function(input,output) {
  output$force = renderForceNetwork({
    fn <- forceNetwork(Links = MisLinks, Nodes = MisNodes,
                       Source = "source", Target = "target", charge = -150,
                       legend = TRUE, opacityNoHover = 1, Nodesize = "size",
                       Value = "value", NodeID = "name",
                       Group = "group", linkWidth = 2, clickAction =  Myclickaction,
                       opacity = 0.9, colourScale =JS("d3.scaleOrdinal(d3.schemeCategory20);"),
                       zoom=TRUE)
    fn$x$nodes$hyperlink <- hyperlink
    fn
  })
}
shinyApp(ui = ui, server = server)
