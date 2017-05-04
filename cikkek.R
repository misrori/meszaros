library(rvest)
library(stringr)


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

