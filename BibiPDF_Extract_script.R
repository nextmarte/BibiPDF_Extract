install.packages("pdftools")
library(pdftools)

pdf.file <- "C:\Users\nextm\OneDrive\Área de Trabalho\BibiPDF Extract\Exemple\2020_EnANPAD_EOR937.pdf"
setwd("C:\Users\nextm\OneDrive\Área de Trabalho\BibiPDF Extract")
download.file(pdf.file, destfile = "sample.pdf", mode = "wb")