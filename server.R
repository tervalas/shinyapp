library(shiny)
library(caret)

shinyServer(function(input, output) {
   model <- reactive({
       brushed_data <- brushedPoints(mtcars,input$brush1,xvar="wt",yvar="mpg")
       if(nrow(brushed_data)<2){
           return(NULL)
       }
       lm(mpg~wt, data=trainData)
   })
   output$slopeOut <- renderText({
       if(is.null(model())){
           "No Model Found"
       } else {
           model()[[1]][2]
       }
   })
   output$intOut <- renderText({
       if(is.null(model())){
           "No Model Found"
       } else {
           model()[[1]][1]
       }
   })
   output$plot1 <- renderPlot({
       plot(mtcars$wt,mtcars$mpg,xlab="Weight",ylab="Miles Per Gallon",main="How Weight Affects Milage",cex=1.5,pch=16,bty="n")
       if(!is.null(model())){
           abline(model(),col="blue",lwd=2)
       }
   })
})
