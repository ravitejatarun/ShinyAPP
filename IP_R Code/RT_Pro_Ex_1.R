
library(tidyverse)
library(magrittr)
library(ggplot2)
library(readr)
library(shiny)
#remove.packages("rlang")
#install.packages("rlang")

data <- as.data.frame(read_csv("RTproteinEx_1.csv"))
data2 <- data %>% pivot_longer(cols =2:13, names_to="Tumor", values_to="value")
data2
ui <- fluidPage(
  br(),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "plot_name",
                label = "Enter plot name"),
      selectInput(inputId = "yAtt", 
                  label    = "y axis",
                  choices  = c("cMET",	"HER2",	"PD1",	"PDL1",	"EGFR",	"HER3",	"KRAS",	"PTEN",	"P53",	"AKT","PCNA"))),
    mainPanel(
      plotOutput(outputId = "ex_plot", 
                 width = "600px", height = "600px")
    )  ) )

server <- function(input, output, session) {
  output$ex_plot <- renderPlot({
    #data1 <- subset(data1, Protein == input$yAtt)
    data2 %>% 
      subset(Protein==input$yAtt) %>% 
      mutate(Tumor=factor(Tumor,levels = Tumor)) %>% 
      ggplot(aes(x = Tumor, y = value)) +
      geom_point(size = 3, colour = "red") + 
      ggtitle(input$plot_name) + xlab("Tumor Types") + ylab("Folds Expression") 
  })
  
}

shinyApp(ui, server)
