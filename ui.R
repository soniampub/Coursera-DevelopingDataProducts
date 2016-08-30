library(shiny)


shinyUI(navbarPage("Select your car features", 
                   sidebarLayout(sidebarPanel(
                     checkboxGroupInput('tran', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
                     checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                     numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000),
                     sliderInput('disp', 'Displacement', min=50, max=500, value=c(50,500), step=10),
                     sliderInput('hp', 'Gross horsepower', min=50, max=500, value=c(50,500), step=10)
                     
                   ), mainPanel(dataTableOutput('finaltable')))
                   
                   ))