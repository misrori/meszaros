library(plotly)
ceg_info <- read.csv('ceg_infok.txt', sep = '\t')

my_company_plot <- function(adat, ceg_id){

  adatom <- adat[adat$ceg_id==ceg_id,]
  
  
  p <- plot_ly(adatom, x = ~ev, y = ~ado_elott, type = 'bar', name = 'ado_elott') %>%
    add_trace(y = ~ado_utan, name = 'ado_utan') %>%
    add_trace(y = ~merleg, name = 'merleg') %>%
    layout(yaxis = list(title = 'Összeg'), barmode = 'group')
  
  
  return(p)
}

my_company_plot(adat = ceg_info, ceg_id = 2)
