library(shiny)
data(mtcars)
mtcars$am <- factor(mtcars$am,levels=c(0,1),labels=c("Automatic","Manual")) 

#Best linear model fit based on Project done in Coursera Data Science Module 7
fit <- lm(mpg~wt+am+qsec,mtcars)

# Define server logic required to plot various variables against mpg
shinyServer(
  function(input, output) {
  
    # argDf <- renderDataTable(data.frame(wt=input$carWt,am=input$carAm,qsec=input$carQsec))
    
    result <- renderText({
      predict(fit,data.frame(wt=input$carWt,am=input$carAm,qsec=input$carQsec))
    })
  
    output$mpgresult<-result
    output$wtSelect <- renderText({input$carWt})
    output$qsecSelect <-renderText({input$carQsec})
    output$amSelect <-renderText({input$carAm})
  
    }
)