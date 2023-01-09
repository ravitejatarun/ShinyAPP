library(shiny)
library(readr)

ui <- fluidPage(
    titlePanel("Trialtrove-Ontology ANSI File"),
    sidebarLayout(
      sidebarPanel(
        fileInput("fileR", "Choose CSV File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
        downloadButton("downloadData", "Download")
      ),
    mainPanel(
    )
    )
)
server <- function(input,output,session){
  lines_vector1 <- reactive({
    
    req(input$fileR) 
    ansi_Rscript <- read_csv(input$fileR$datapath[1])
    
    lines_vector <- c()
   
    SIDvar <- "SID Ansi Rscript"
    macroName <- "ansi_Rscript"
    a <-  paste0(SIDvar, "\n")
    lines_vector <- c(lines_vector, a)
    b <- paste0(macroName, "\n")
    lines_vector <- c(lines_vector, b)
    c <- paste0("PT ",macroName, "\n")
    lines_vector <- c(lines_vector, c)
    
    for(r in c(1:nrow(ansi_Rscript))){
        NT <- ansi_Rscript[r,1][[1]]
        d <- paste0("NT ", NT) 
        lines_vector <- c(lines_vector,d)
    }
    lines_vector <- c(lines_vector, "\n")
    
    for (s in c(1:nrow(ansi_Rscript))) {   
        Trial_ID <- ansi_Rscript[s,1][[1]] 
        Protocol_ID <-unlist(strsplit(x = ansi_Rscript[s,2][[1]], split = "\n"))
        #print(Protocol_ID) prints to the console
        e <-  paste0(Trial_ID)
        lines_vector <- c(lines_vector, e)
        
        f <- paste0("PT ",Trial_ID)
        lines_vector <- c(lines_vector, f)
     
        for (syn in Protocol_ID) {
          g <- paste0("SYN ", syn) 
          lines_vector <- c(lines_vector,g)
        }
        lines_vector <- c(lines_vector,"\n")
    }
    lines_vector <- c(lines_vector,"\n")
  })

    output$downloadData <- downloadHandler(
        filename = function() {
          paste("nctscript", ".ansi", sep = "")
        },
        content = function(file){
          write_lines(lines_vector1(), file)
        }
    )
}

shinyApp(ui, server)

