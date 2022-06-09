
library(pdftools)
library(stringr)
library(dplyr)
library(purrr)

#set wd to folder where .pdf file is located
setwd("C:/Users/nextm/OneDrive/Área de Trabalho/BibiPDF_Extract/BibiPDF_Extract/Exemple")

#read in .pdf format news article
article_path <- list.files("C:/Users/nextm/OneDrive/Área de Trabalho/BibiPDF_Extract/BibiPDF_Extract/Exemple", pattern = "pdf$")

#read in article using lapply
article <- lapply(article_path, pdf_text)


#convert to chr class
article <- as.character(article)

eoa<-"fim do artigo"

article <-str_c(article,eoa)


get_data <- function(dat) {
  list(Ref = str_trim(str_extract(dat, "(?<=Referências:)(?s)(.*?)(?=fim do artigo)"))
  )
}

article_df <- map_dfr(article,get_data)
article_df

#article_df<-cat(paste(article_df,sep="\n"))
#salva o arquivo em csv
write.csv(article_df, file = "my_data.txt")


