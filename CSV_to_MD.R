#Script to convert .csv to MD table


Path_to_CSV<-"~/Documents/ICES/Sandeel_Reports/SandEel_TAF/Tables_and_Figures.csv"


md_table <- function(df){
  paste0('|', paste(names(df), collapse = '|'), '|\n|', 
         paste(rep('---', length(df)), collapse = '|'), '|\n|', 
         paste(Reduce(function(x, y){paste(x, y, sep = '|')}, df), collapse = '|\n|'), '|')
}

TABLE<-read.csv(Path_to_CSV,header=T)


writeLines(md_table(TABLE),paste0(substr(Path_to_CSV,start = 1,stop = nchar(Path_to_CSV)-3),"md"))
