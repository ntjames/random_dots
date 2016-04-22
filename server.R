library(shiny)

shinyServer(function(input, output) {
  
# rand.seed<-reactive({set.seed(input$seed)}) 
  
  mydist <- reactive({
    dist <- switch(input$dist,
                   Normal = rnorm,
                   Exponential = rexp,
                   Uniform = runif,
                   rnorm)    
    dist(input$integer)
  })
  
   
  sliderValues <- reactive({

  z<-cut(runif(input$integer),3)
   
  x<-mydist()
  y<-runif(input$integer)  

  x<-split(x,z)
  y<-split(y,z)
  
  #rand.seed()
  set.seed(458945)
  plot(x[[1]],y[[1]], pch=16, col=rgb(1,0,0,.1),yaxt="n",xaxt="n",ylab="",xlab="")
  points(x[[2]],y[[2]], pch=16, col=rgb(0,1,0,.05))
  points(x[[3]],y[[3]], pch=16, col=rgb(0,0,1,.05))  
  
  }) 
  
  output$myplot <- renderPlot({      
    sliderValues()
  }) 
  
})





