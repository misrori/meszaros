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

add_new_plot <- function(teljes){
  if(length(teljes)==0){
    temp <- list(source = "https://images.plot.ly/language-icons/api-home/python-logo.png",
                 xref = "paper",
                 yref = "paper",
                 x=0.1,
                 y= 0.9,
                 sizex = 2,
                 sizey = 2,
                 opacity = 1
    )
    teljes[[length(teljes)+1]] <- temp
    return(teljes)
  }else{
  
  temp <- list(source = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/10_kapeykas_Belarus_2009_reverse.png/100px-10_kapeykas_Belarus_2009_reverse.png",
               xref = "paper",
               yref = "paper",
               x= runif(1),
               y= runif(1),
               sizex = 0.2,
               sizey = 0.2,
               opacity = 1
  )
  teljes[[length(teljes)+1]] <- temp
  return(teljes)
  }
}

my_money_plot <- function(teljes) {
  ax <- list(
    title = "",
    zeroline = FALSE,
    showline = FALSE,
    showticklabels = FALSE,
    showgrid = FALSE
  )
  p<- plot_ly(x = c(0,10), y = c(0,10)) %>%
    layout(xaxis = ax, yaxis = ax, images = teljes )
  return(p)
}

index_cikkek <- function() {
  
  index_page <- html("http://index.hu/24ora/?word=1&pepe=1&tol=1999-01-01&ig=2017-05-04&s=M%C3%A9sz%C3%A1ros+L%C5%91rinc")
  cimek <- 
    index_page %>%
    html_nodes(".cim a")%>%
    html_text()
  
  leiras <- 
    index_page %>%
    html_nodes(".ajanlo")%>%
    html_text()
  
  linkek <- 
    index_page %>%
    html_nodes(".cim a ")%>%
    html_attr("href")
  
  
  megjelenes <- 
    index_page %>%
    html_nodes(".cikk-date-label")%>%
    html_text()
  
  megjelenes <- str_trim(gsub('\n', '', megjelenes))
  cikk_vege <-data.table('cimek'=cimek, 'leiras'= leiras, 'megjelenes'=megjelenes, 'linkek'=linkek)
  
  
  return(cikk_vege)
  
}