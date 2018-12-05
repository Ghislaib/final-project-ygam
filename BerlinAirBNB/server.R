library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)

df <- read.csv("listings.csv", stringsAsFactors = FALSE)
colnames(df)[4] <- "Host Name"
colnames(df)[9] <- "Type of Room"
colnames(df)[11] <- "Minimum amount of Nights"
colnames(df)[14] <- "Average Reviews per Month"

berlin_data <- df %>% 
  select(neighbourhood, `Host Name`, price, `Average Reviews per Month`,
         `Type of Room`, `Minimum amount of Nights`)

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
              `Minimum amount of Nights` >= input$min_nights[1],
              `Minimum amount of Nights` <= input$min_nights[2],
              `Type of Room` == input$room_type,
              `Average Reviews per Month` >= input$average_reviews[1],
              `Average Reviews per Month` <= input$average_reviews[2])
     m <- leaflet() %>%
       addTiles() %>%
      addMarkers(lng = df$longitude,
                  lat = df$latitude,
                  popup = paste("Average price:", df$price, "<br>",
                                "Minimum nights:", df$`Minimum amount of Nights`, "<br>",
                                "Number of reviews:", df$`Average Reviews per Month`, "<br>",
                                "Host listing:", df$`Host Name`, "<br>",
                                "Availability:", df$availability_365))

   })
   
   output$berlin_data <- renderTable({
     neighbourhoodFilter <- filter(berlin_data,
                                   berlin_data$neighbourhood == input$neighbourhood,
                                   berlin_data$price >= input$price_range[1],
                                   berlin_data$price <= input$price_range[2],
                                   berlin_data$`Type of Room` == input$room_type,
                                   berlin_data$`Minimum amount of Nights` >= input$min_nights[1],
                                   berlin_data$`Minimum amount of Nights` <= input$min_nights[2],
                                   berlin_data$`Average Reviews per Month` >= input$average_reviews[1],
                                   berlin_data$`Average Reviews per Month` <= input$average_reviews[2])
   })
  
})
