# final-project-ygam

Team Members: Ghis, Yash, Max, Alex.
Class: Info 201, AA section
Due Date: December 6, 2018
Project Name: Air Bnb in Berlin

Design: Our team used shiny apps to create a user interface which organizes Airbnb listings in Berlin by Neighborhood and Price. After selecting a Neighborhood in Berlin, users can use the map to navigate and view the Airbnb's location. Along with the geographial information, all the listings in the neighborhood are listed in a table below. This table tracks neighbourhood, host name, price, reviews per month, room type and the minimum nights required to be accepted for a booking. 

Features: We pulled the information for Airbnb listings using public data on the insideairbnb.com website. This website publically displays information on Airbnb in individual cities, and allows users to download the data set. We then used the leaflet library to create a map ui for the user, plotting the Airbnb data over the leaflet ui we produced the visual element. We used the sliderInput and selectInput shiny widgets to allow users to fileter for price and neighborhood respectively. 