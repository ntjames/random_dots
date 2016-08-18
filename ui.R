library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Plot Random Dots"),
  
  sidebarPanel(
    sliderInput("integer","How many dots?",min=100,max=50000,value=500),
    
    selectInput("dist", "Which distribution?", 
                choices = c("Normal", "Exponential","Uniform"))
    
    #,numericInput("seed", "random seed:", 10)
    ),
  
  mainPanel(    
    plotOutput("myplot")
    )
))
