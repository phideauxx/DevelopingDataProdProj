library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Grade Calculator"),
  
    sidebarPanel(
      h4("Please use the sliders to represent your scores on each of the items below."),
      sliderInput('quiz', 'Quiz Points out of 20', 10, min = 0, max = 20, step = 1),
      sliderInput('homework', 'Homework Points out of 50', 25, min = 0, max = 50, step = 1),
      sliderInput('test', 'Exam Points out of 100', 50, min = 0, max = 100, step = 1)
    ),
    mainPanel(
        h3('Results of scores'),
        h4('You entered'),
        h5('Quiz'),
        verbatimTextOutput("inputQuiz"),
        h5('Homework'),
        verbatimTextOutput("inputHomework"),
        h5('Test'),
        verbatimTextOutput("inputTest"),
        h5('Total Points out of 170'),
        verbatimTextOutput("totalScore"),
        h5('Overall Percentage'),
        verbatimTextOutput("totalPercentage"),
        h4('Which resulted in a grade of '),
        verbatimTextOutput("grade")
    )
  )
)

