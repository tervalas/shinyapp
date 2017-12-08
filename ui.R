
library(shiny)

shinyUI(fluidPage(
  titlePanel("Car Comparisons"),
  tabPanel("Documentation",h3("How to use this app"),
                              tags$ol(
                                  tags$li("Click and drag a box to select data points"),
                                  tags$li("Regression Line and prediciton model will be shown"),
                                  tags$li("Move, resize, or recreate box to see changes to model")
                              )),
  
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
