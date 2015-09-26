library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles Per Gallon Prediction Application"),
  h3("Introduction:"),
  h4("This is a simple application that predicts a vehicle's fuel consumption 
     in miles per gallon (mpg) based on a vehicle's weight, acceleration and the type of transmission."
  ),
  h4("Acceleration refers to the time in seconds a vehicle takes to complete 1/4 of a mile 
    from 0 mile per hour (mph) to its fastest speed."),
  h4("The prediction model, based on linear regression, was built using dataset from MTCARS."),
  
  # Sidebar with controls to select different values
  sidebarPanel(
    
    h4("Select the following values:"),
    
    sliderInput("carWt", "Weight of Car (per 1000 lbs):",
                min=1,max=8,value=1, step=0.2
    ),
    
    sliderInput("carQsec", "Acceleration of Car (in Secs):",
                min=5,max=30,value=1, step=0.1
    ),
    
    radioButtons("carAm", "Choose type of transmission:", 
                 c("Automatic"= "Automatic", "Manual"="Manual")
    )
  ),
  
  # Show a summary of the dataset and an HTML table with the 
  # requested number of observations
  mainPanel(
    h3("Estimated MPG of the vehicle: "),
    h3(textOutput("mpgresult")),
    h4("based on the values you've selected."),
    h4("Car Weight (in 1000 lbs):"),
    h4(textOutput("wtSelect")),
    h4("Acceleration (in sec):"),
    h4(textOutput("qsecSelect")),
    h4("Transmission:"),
    h4(textOutput("amSelect")) 
  )
))