
library(shiny)

shinyUI(fluidPage(
  titlePanel("Car Comparisons"),
  
  sidebarLayout(
    sidebarPanel(
        h3("Change in MPG"),
        textOutput("slopeOut"),
        h3("Intercept"),
        textOutput("intOut")
    ),
    
    mainPanel(
        plotOutput("plot1",brush=brushOpts(id="brush1"))
    )
  )
))
