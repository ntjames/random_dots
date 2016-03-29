library(shiny)


shinyServer(function(input, output) {
  
  
  rand.seed<-reactive({set.seed(input$seed)})
    
  mydist <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   exp = rexp,
                   unif=runif,
                   rnorm)    
    dist(input$integer)
  })
  
   
  sliderValues <- reactive({

  z<-cut(runif(input$integer),3)
   
  x<-mydist()
  y<-runif(input$integer)  

  x<-split(x,z)
  y<-split(y,z)
  
  rand.seed()
  plot(x[[1]],y[[1]], pch=16, col=rgb(1,0,0,.1),yaxt="n",xaxt="n",ylab="",xlab="")
  points(x[[2]],y[[2]], pch=16, col=rgb(0,1,0,.05))
  points(x[[3]],y[[3]], pch=16, col=rgb(0,0,1,.05))  
  
  }) 
  
  
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$myplot <- renderPlot({      
    sliderValues()
  })
  
  
})





