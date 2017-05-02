library(plotly)
ceg_info <- read.csv('ceg_infok.txt', sep = '\t')

my_company_plot <- function(adat){

  my_title <- adatom$name[1]
  
  p <- plot_ly(adatom, x = ~ev, y = ~ado_elott, type = 'bar', name = 'ado_elott') %>%
    add_trace(y = ~ado_utan, name = 'ado_utan') %>%
    add_trace(y = ~merleg, name = 'merleg') %>%
    layout(title = my_title, yaxis = list(title = 'Millió(Ft)'),xaxis = list(title = 'Év'), barmode = 'group',)
  
  
  return(p)
}

my_company_plot(adat = ceg_info, ceg_id = 4)
