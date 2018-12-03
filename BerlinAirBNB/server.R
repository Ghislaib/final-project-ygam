library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)

df <- read.csv("listings.csv", stringsAsFactors = FALSE)


berlin_data <- df %>% 
  select(neighbourhood, host_name, price, reviews_per_month, room_type, minimum_nights)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  

  data <- reactive({
     x <- df
   })
   
   output$mymap <- renderLeaflet({
     df <- data() %>% 
       filter(neighbourhood == input$neighbourhood,
              price >= input$price_range[1],
              price <= input$price_range[2],
              minimum_nights >= input$min_nights[1],
              minimum_nights <= input$min_nights[2])
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
   
   output$berlin_data <- renderTable({
     neighbourhoodFilter <- filter(berlin_data,
                                   berlin_data$neighbourhood == input$neighbourhood,
                                   berlin_data$price >= input$price_range[1],
                                   berlin_data$price <= input$price_range[2])
   })
  
})
