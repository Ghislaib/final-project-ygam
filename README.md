# FINAL-PROJECT-YGAM

**Team Members:** Ghis, Yash, Max, Alex <br />
**Group:** AA 5 <br />
**Class:** INFO 201, AA section <br />
**Due Date:** December 6, 2018 <br />
**Project Name:** Airbnb in Berlin <br />

#**Design** <br />
Our team used shiny apps to create a user interface which organizes Airbnb listings in Berlin by Neighborhood and Price. 
After selecting a Neighborhood in Berlin, users can use the map to navigate and view the Airbnb's location. Along with 
the geographial information, all the listings in the neighborhood are listed in a table below. This table tracks neighbourhood, 
host name, price, reviews per month, room type and the minimum nights required to be accepted for a booking. 

**Features** <br />
We pulled the information for Airbnb listings using public data on the [Berlin Data](http://insideairbnb.com/berlin/) website. 
This website publically displays information on Airbnb in individual cities, and allows users to download the data set. 
We then used the leaflet library to create a map ui for the user, plotting the Airbnb data over the leaflet ui we produced 
the visual element. We used the sliderInput and selectInput shiny widgets to allow users to filter for price and neighborhood respectively. 

**Widget 1** <br />
The first widget in our app is a dropdown that allows the user to select a particular neighbourhood that they wish to live in. 
This was done using the dplyr package in R. With a number neighbourhoods to choose from, this app makes it easy for the users to 
choose a specific neighbourhood. Upon selecting a specific neighbourhood the map along with the data changes. The changes are quite evident 
on the map.

**Widget 2** <br />
The second widget in our app is a slider input that provides the user to select the particular price range in which they wish
to see the listings of the hosts. Since there are a lot of listings in the data, this app makes it easy for the users to select
a particular price range as per their budget. With the change in the price range the map as well as the data changes. The changes 
are quite evident on the map.

**Widget 3** <br />
The third widget in our app is a slider input that allows the users to select the number of minimum nights. The feature was necessary 
since at times the users like a particular listing but the minimmum stay does not match the duration of their stay so this feature 
allows them to do so. This widget also filters out the data and the changes can be seen on the map.

**Widget 4** <br />
The fourth widget in our app is a dropdown that allows the user to select the type of room they wish to check. Even this was done 
using the dplyr package in R. It allows the user to either select Private Room, Shared Room or an Entire Home. This makes the choice 
for the user very easy. This widget also filters out the data and the changes can be seen on the map.

**Widget 5** <br />
The fifth and the last widget is a slider input that allows the user to assess the host by checking the number of average reviews 
per month. Since it is necessary for the users to know the rating/average reviews for the host, this widget in our app helps the
users with this issue.

**Link for the Shiny App** <br />
The project we build using this data set was published to the Shiny App. <br />
[Final-Project-YGAM](https://ghislainb.shinyapps.io/BerlinAirBNB/)
