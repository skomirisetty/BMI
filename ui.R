library(shiny)

# Define UI for application that calculates the BMI

shinyUI(fluidPage(
  # Application title
  titlePanel("BMI Calculator"),
  p("Instructions:  To calculate your body mass index enter your height and weight in the left
    side panel windows.  There are three inputs.Height in feet and inches, weight. When you 
    have your information entered, press the Calculate BMI button at the bottom.  The 
    calculator comes preset with a height of 5 foot 9 inches and a weight of 165 pounds."),
  br(),
  # Sidebar with a three text inputs
  sidebarLayout(position = "left",
                sidebarPanel(
                  h2('Enter your physical information:'),
                  h3('Height'),
                  numericInput("hf", label = h4("feet"),max=7,min=2, value = 5),
                  numericInput("hin", label = h4("inches"),max=12,min=0, value = 9),
                  h3('Weight'),
                  #     This is some code that if I wanted to use a slider instead of text input 
                  #      sliderInput(inputId = "wlbs", label = h4("pounds"),
                  #                  min = 50, max = 350, value = 165)
                  numericInput("wlbs", label = h4("pounds"),max=350,min=0, value = 165),
                  submitButton('Calculate BMI')
                ),
                # Show the data entered and the calculated BMI
                mainPanel(
                  # plotOutput("distPlot")
                  h3('You entered the following information:'),
                  h4(textOutput("height_summary")),
                  h4(textOutput("weight_summary")),
                  br(),
                  h3('Calculated Body Mass Index:'),
                  h4(textOutput("bmi")),
                  br(),
                  h4('A table to evaluate your body fat:'),
                  tableOutput("bmitable")
                )
  )
  ))