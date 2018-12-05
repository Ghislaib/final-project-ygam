library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)


df <- read.csv("listings.csv", stringsAsFactors = FALSE)


berlin_data <- df %>% 
  select(neighbourhood, host_name, price, reviews_per_month, room_type, minimum_nights)


ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "Berlin Airbnb"),
  dashboardSidebar(
    selectInput("neighbourhood", "Select a neighbourhood", choices = unique(berlin_data$neighbourhood),
                selected = "Mitte"
                ),
    sliderInput("price_range", label = "Price Range $$",
                0, 500,
                value = c(0, 500),
                sep = "",
                step = 1),
    sliderInput("min_nights", label = "Minimum Nights",
                0, 500,
                value = c(0, 500),
                sep = "",
                step = 1),
    selectInput("room_type", "Room Type", choices = unique(berlin_data$room_type),
                selected = "Private room")
    ),
  dashboardBody(
    fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 12, tableOutput(outputId = "berlin_data")))
  )

)



