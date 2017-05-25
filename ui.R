library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Plot Random Dots"),
  
  sidebarPanel(
    sliderInput("integer","How many dots?",min=100,max=5000,value=100),
    
    selectInput("dist", "Which distribution?", 
                choices = c("Normal", "Exponential", "Uniform", "Cauchy",
                            "Logistic", "Lognormal"))
    
    #,numericInput("seed", "random seed:", 10)
    ),
  
  mainPanel(    
    plotOutput("myplot")
    )
))
