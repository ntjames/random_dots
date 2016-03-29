library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Plot Random Dots"),
  
  sidebarPanel(
    sliderInput("integer","n:",min=100,max=50000,value=500),
    
    selectInput("dist", "Choose a distribution:", 
                choices = c("Normal", "Exponential","Uniform")),
    
    numericInput("seed", "random seed:", 10)
    ),
  
  mainPanel(    
    plotOutput("myplot")
    )
))
