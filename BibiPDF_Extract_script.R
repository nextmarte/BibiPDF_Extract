
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

article

#adding a string identifier at the end of the main string
eoa<-"final do artigo"
article <-str_c(article,eoa)


str_trim(str_extract(article,"^((?:.+?, .+?;)*?"))

article 
#function to find the beginning of the reference data
get_data <- function(dat) {
  list(Ref = str_trim(str_extract(dat, "(?<=Referências)(?s)(.*?)(?=\n\n\n\)"))
  )
}

article_df <- map_dfr(article,get_data)
article_df

#article_df<-cat(paste(article_df,sep="\n"))
#salva o arquivo em csv
write.csv(article_df, file = "my_data.txt")


