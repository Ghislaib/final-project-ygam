library(shiny)
library(dplyr)
library(leaflet)


df <- read.csv("listings.csv", stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Map"),
  
  # Sidebar with a slider input for number of bins 
  leafletOutput("mymap",height = 1000)
  
    )
    
    # Show a plot of the generated distribution
    # mainPanel(
    # )
  )

