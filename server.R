library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output){
  
  output$finaltable <- renderDataTable({
    dispseq <- seq(from = input$disp[1], to=input$disp[2], by=0.5)
    hpseq <- seq(from = input$hp[1], to=input$hp[2], by=0.5)
    
    data <- transmute(mtcars, Car=rownames(mtcars), Transmission = am, Cylinders = cyl, Displacement = disp, Horsepower = hp)
    data <- filter(data, Transmission %in% input$tran, Cylinders %in% input$cyl, 
                   Displacement %in% dispseq, Horsepower %in% hpseq)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data
    
    
    
  }, options = list(lengthMenu = c(5, 10, 15), pageLength = 15))
  
  
})