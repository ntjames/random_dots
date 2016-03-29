library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Random Plot"),
  
  sidebarPanel(
    sliderInput("integer","n:",min=100,max=50000,value=500),
    
    selectInput("dist", "Choose a dist:", 
                choices = c("norm", "exp","unif")),
    
    numericInput("seed", "random seed:", 10)
    ),
  
  mainPanel(    
    plotOutput("myplot")
    )
))
