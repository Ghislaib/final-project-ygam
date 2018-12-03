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
    selectInput("neighbourhood", "Select a neighbourhood", choices = (berlin_data$neighbourhood),
                selected = "Mitte"
                ),
    sliderInput("price_range", label = "Price Range $$",
                min = min(df$price),
                max = max(df$price),
                value = c(min, max),
                sep = "",
                step = 1),
    sliderInput("min_nights", label = "Minimum Nights",
                min = min(df$minimum_nights),
                max = max(df$minimum_nights),
                value = c(min, max),
                sep = "",
                step = 1)
    ),
  dashboardBody(
    fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 12, tableOutput(outputId = "berlin_data")))
  )

)



