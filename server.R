library(shiny)
# Functions needed to get height in inches and BMI to 2 decimal places

hinches <- function(hft,hin)hft*12+hin

bmi <- function(h,w) round((w/h^2)*703,2)

bmistatus <- function(bmi){
  if(bmi<18.5){
    status = "Underweight"
  } else if(bmi<25){
    status = "Normal"
  } else if(bmi< 30){
    status = "Overweight"
  } else{
    status = "Obese"
  }
  return(status)
}
# Define server logic required to calculate BMI
shinyServer(function(input, output) {
  output$height_summary <- renderText({paste0("Height: ",input$hf," feet and ",input$hin, " inches.")
  })
  output$weight_summary <- renderText({paste0("Weight: ",input$wlbs," pounds.")
  })
  output$bmi <- renderText({
    bmical<-bmi(hinches(input$hf,input$hin),input$wlbs)
    paste0("Based on the input, your BMI is: ",bmical," and you are considered ",bmistatus(bmical))
  })
  output$bmitable <- renderTable({
    data.frame(BMI=c("Below 18.5","18.5 to 24.9","25.0 to 29.9","Over 30"),Status=c("Underweight","Normal","Overweight","Obese"))
  },include.rownames=FALSE)
})