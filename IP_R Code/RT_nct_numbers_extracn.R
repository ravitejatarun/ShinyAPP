library(readr)
tt_856_39drugs <- read_csv("tt_856_39drugs.csv")
View(tt_856_39drugs)


tt_856_39drugs

#**********************************

rt <- "D0810C00002\r\nKU36-92\r\nN0258161827\r\nNCT00516373\r\nTrialTroveID-031463"
  
syn <- unlist(regmatches(x=rt, gregexpr(pattern= "NCT{1}\\d{8}",text= rt)))
cat(noquote(paste0(syn,"\n")))


print(noquote(paste0(syn,"\n")))
#used website https://regex101.com/  to get code "NCT{1}\\d{8}" NCT w/8 digits for NCT numbers 
#\r\n not required bcoz extracts the string exactly we want.

sink("nct_numbers.csv")

for (r in c(1:nrow(tt_856_39drugs))) {  
  Protocol_ID <-unlist(regmatches(x = tt_856_39drugs[r,2][[1]],
                                  gregexpr(pattern= "NCT{1}\\d{8}",
                                           text= tt_856_39drugs[r,2][[1]])))
  for (nct in Protocol_ID) {
    cat(noquote(paste0(nct, "\n")))
  }                   
}

sink()

#regexpr() below gives NCT 1st time encountered; whereas gregexpr() above gives whatever x times present in the string

sink("nct_numbers1.csv")

for (r in c(1:nrow(tt_856_39drugs))) {  
  Protocol_ID <-unlist(regmatches(x = tt_856_39drugs[r,2][[1]],regexpr(pattern= "NCT{1}\\d{8}",text= tt_856_39drugs[r,2][[1]])))
  for (nct in Protocol_ID) {
    cat(noquote(paste0(nct, "\n")))
  }                   
}

sink()












gsub  # function find and replace


x <- c("file_a.csv", "file_b.csv", "file_c.csv")
y <- gsub("file_", "", x) # find file_ and replace with nothing"" in the x object
y

x <- c("Arkansas", "Alabama", "Calabash", "Washington")
pattern <- "[Aa][^a]*a" # sequences starting with A or a and continuing up to next a.
pattern

regmatches(x, gregexpr(pattern, x)) 
regmatches(x, gregexpr(pattern, x), invert = TRUE) 

regmatches(x, regexpr(pattern, x))
regmatches(x, regexpr(pattern, x), invert = TRUE)
tmp <- x
regmatches(tmp, gregexpr(pattern, tmp))  <- paste0("<",seq_along(x),">")
tmp
# NCT <- "NCT Extraction"
# cat(noquote(paste0(NCT, "\n")))

#  https://www.youtube.com/watch?v=h987LWDvqlQ
x <- c(-2,5,6,8,9)
x

for (i in x){
  print(c(i,i^2))
}

# data structures: https://www.youtube.com/watch?v=s1EkGFU4mJs

x <- c(5,10)
x1 <- c("ravi", "Jon", "Bob", c(4,5,6))
y <- c(100,200,500,800)

list_a <- list(x,x1,y)
list_a[[1]] # first component
list_a[[1]][1] # first component of first element
list_a[[2]] 
list_a[[2]][1]

typeof(list_a[2][[1]])

#sink()
