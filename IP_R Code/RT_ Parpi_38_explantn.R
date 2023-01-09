
library(readr)
parpis <- read_csv("38_parpis.csv")
View(parpis)

#parpi function:

parpi_func <- function(parpis,fileName,SIDvar,macroName){

sink(fileName) #w/o sink() writes the output to console
tmpList = list()

# creating parpi_func function name. 
# sink() writes to file need to open and close at the end
#reading row by row of parpis data set (DF)
# assigning each row of column 1 to PT object
# doing structure str split at semicolon and of each row of column 2 and unlisting the strings and 
# adding SYN object
# temp list of PT and adding as vector format of all the SYN words. in other words [PT] [[SYN]]

# adding SIDvar whatever we provide in the function with unquote just as a string
# cat function gives just word w/o quotes or vector.
# print() gives assingns as vector
#***************
#reading thorough templist of PT term ie item [] gives PT
# adding NT term to the PT list.

for(row in c(1:nrow(parpis))) {
  PT <- parpis[row,1][[1]]
  SYN <- unlist(strsplit(x = parpis[row,2][[1]], split = "; "))
  tmpList[[PT]] <- SYN
}

# explanation for above for loop
# reading parpis data through row wise from row one to nrow
# Assigning to PT while reading from row, column 1 of [[]]  element add to templist 
# Assigning to SYN while reading from row, column 2 of [[]]  elements (unlist) add to templist 
# In a templist PT adding SYN



cat(noquote(paste0(SIDvar, "\n")))  
cat(noquote("\n"))
cat(noquote(paste0(macroName, "\n"))) # just macro name here w/o PT
cat(noquote(paste0("PT ",macroName, "\n"))) # adding PT term to the macro names

for(item in c(1:length(tmpList))) {
  NT <- names(tmpList[item])
  cat(noquote(paste0("NT ", NT,"\n")))
}
cat(noquote("\n")) # add new line

for(item in c(1:length(tmpList))) {
  PT <- names(tmpList[item])
  cat(noquote(paste0(PT,"\n")))  # pasting just PT term 
  cat(noquote(paste0("PT ", PT,"\n")))  # pasting just PT with PT term from templ listing
  for(el in tmpList[[item]]) {
    cat(noquote(paste0("SYN ", el, "\n"))) # reading lement in PT list and adding SYN to get hierarchy
  
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








