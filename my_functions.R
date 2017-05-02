my_company_plot <- function(adat){
  
  my_title <- adat$Ceg_nev[1]
  
  f <- list(
    family = "Courier New, monospace",
    size = 18,
    color = "#7f7f7f"
  )
  x <- list(
    title = "Év",
    titlefont = f
  )
  y <- list(
    title = "Nyereség (Millió Ft)",
    titlefont = f
  )
  
  m <- list(
    l = 80,
    r = 80,
    b = 50,
    t = 50,
    pad = 4
  )
  
  
  p <- plot_ly(adat, x = ~ev, y = ~ado_elott, type = 'bar', name = 'ado_elott') %>%
    add_trace(y = ~ado_utan, name = 'ado_utan') %>%
    add_trace(y = ~merleg, name = 'merleg') %>%
    layout(title = my_title, yaxis =y,xaxis = x, margin = m, barmode = 'group')
  return(p)
}

my_empty_plot <- function() {
    
  m <- list(
    l = 80,
    r = 80,
    b = 50,
    t =750,
    pad = 4
  )
  ax <- list(
    title = "",
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  p <- plot_ly(x=0,y=0,mode="markers",type="scatter")%>%
    layout(title='Válassz céget',margin=m, xaxis = ax, yaxis = ax)
  return(p)
}


