
library(readr)
parpis <- read_csv("38_parpis.csv")
View(parpis)

#parpi function:

parpi_func <- function(parpis,fileName,SIDvar,macroName){

sink(fileName) #w/o sink() writes the output to console
tmpList = list()

for(row in c(1:nrow(parpis))) {
  PT <- parpis[row,1][[1]]
  SYN <- unlist(strsplit(x = parpis[row,2][[1]], split = "; "))
  tmpList[[PT]] <- SYN
}
cat(noquote(paste0(SIDvar, "\n")))
cat(noquote("\n"))
cat(noquote(paste0(macroName, "\n")))
cat(noquote(paste0("PT ",macroName, "\n")))

for(item in c(1:length(tmpList))) {
  NT <- names(tmpList[item])
  cat(noquote(paste0("NT ", NT,"\n")))
}
cat(noquote("\n"))

for(item in c(1:length(tmpList))) {
  PT <- names(tmpList[item])
  cat(noquote(paste0(PT,"\n")))
  cat(noquote(paste0("PT ", PT,"\n")))
  for(el in tmpList[[item]]) {
    cat(noquote(paste0("SYN ", el, "\n")))
  
  }
  cat(noquote("\n"))
}

sink()  
}

#download .ANSI file
parpi_func(parpis,"parpis.ansi","SID Ravi Tammali","PARPi_drugs")

#****************************************************************************************













setwd("C:\\Users\\kchz694\\Documents")
getwd()

x <- parpi_func(parpis)print(parpis,quote=FALSE)

rt <- function(x) print(formatC(x, format="fg", big.mark=","), quote=FALSE)



#cat can useful for things like writing a string to file:
cat(noquote("love"))
print(noquote("love"))

#******************************************
#print returns a character vector:
  
print(paste("a", 100* 1:3))
class(print(paste("a", 100* 1:3)))

#cat returns an object of class NULL.

cat(paste("a", 100* 1:3))
class(cat(paste("a", 100* 1:3)))
#*********************************************************

coefs <- lm(Sepal.Width ~  Petal.Length, iris) %>%
  print() %>%
  coefficients()


circ.area1 <- function(r){
  area <-pi*r^2      #if you assign to variable need to use return()
return(area)
}

circ.area1(1)
circ.area <- function(r){
    return(pi*r^2)
  }
circ.area(1)
circ.area1(1)

circ.area2 <- function(r){
pi*r^2
}
circ.area2(1)








