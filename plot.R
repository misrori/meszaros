library(plotly)
adat <- read.csv('ceg_infok.txt', sep = '\t')
adat <- adat [adat$ceg_id==1,]


p <- plot_ly(adat, x = ~ev, y = ~ado_elott, type = 'bar', name = 'ado_elott') %>%
  add_trace(y = ~ado_utan, name = 'ado_utan') %>%
  add_trace(y = ~merleg, name = 'merleg') %>%
  layout(yaxis = list(title = 'Összeg'), barmode = 'group')


p
