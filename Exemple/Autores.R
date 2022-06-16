

setwd("C:/Users/nextm/OneDrive/Área de Trabalho/BibiPDF_Extract/BibiPDF_Extract/Exemple")
autores <- read_csv("BibiPDF_Extract/BibiPDF_Extract/Exemple/autores.csv")

autores

autores<-str_extract(autores$`Autores;;;`,"(.+)(?=\\()")

autores<-as.character(autores)
  
write.csv(autores,file = "Autores_clear.txt")




             
                 
                 
                  