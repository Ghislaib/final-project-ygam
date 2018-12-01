library(shiny)
library(dplyr)
library(leaflet)

df <- read.csv("listings.csv", stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data <- reactive({
    x <- df
  })
  
  output$mymap <- renderLeaflet({
    df <- data()
    m <- leaflet() %>%
      addTiles() %>%
      addMarkers(lng = df$longitude,
                 lat = df$latitude,
                 popup = paste("Average price:", df$price, "<br>",
                               "Minimum nights:", df$minimum_nights, "<br>",
                               "Number of reviews:", df$number_of_reviews, "<br>",
                               "Host listing:", df$host_name, "<br>",
                               "Availability:", df$availability_365))

  })
  
})
