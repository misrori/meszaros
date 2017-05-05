library(rvest)
library(stringr)


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


osszes_cikk<- list()
for(i in 1:length(cimek)){
egy_cikk<- 
  paste(cimek[i],'\n',
        leiras[i], '\n',
        linkek[i], '\n',
        sep = ' '
        )  
osszes_cikk[i]<- egy_cikk

```{r}
egy_cikk
```


}

cik_vege <- str_c(osszes_cikk, collapse = '\n \n')

return(cik_vege)

}

adat_cikkek <- index_cikkek()




