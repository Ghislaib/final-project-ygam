library(shiny)
library(dplyr)
library(leaflet)
library(shinydashboard)
library(rgdal)
library(DT)


df <- read.csv("listings.csv", stringsAsFactors = FALSE)


berlin_data <- df %>% 
  select(neighbourhood, host_name, price, reviews_per_month, room_type)

# # Define UI for application that draws a histogram
# shinyUI(fluidPage(
#   
#   # Application title
#   titlePanel("Berlin Airbnb"),
#   
#   # Sidebar with a slider input for number of bins 
#   leafletOutput("mymap",height = 1000)
#   
#     )
#     
#     # Show a plot of the generated distribution
#     # mainPanel(
#     # )
#   )


ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "Berlin Airbnb"),
  dashboardSidebar(
    selectInput("neighbourhood", "Select a neighbourhood", choices = (berlin_data$neighbourhood),
                selected = "Mitte"
                ),
    sliderInput("price_range", label = "Price Range",
                min = min(df$price),
                max = max(df$price),
                value = c(min, max),
                sep = "",
                step = 1)
    ),
  dashboardBody(
    fluidRow(box(width = 12, leafletOutput(outputId = "mymap"))),
    fluidRow(box(width = 12, tableOutput(outputId = "berlin_data")))
  )

)



