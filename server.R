library(shiny)

#Determine letter grade based on total Percentage earned.
gradeRisk <- function(quiz, homework, test){
  percent <- totalPercent(quiz, homework, test)
  if (percent >= 90)  letterGrade <- "A" 
  else if (percent >= 80)  letterGrade <- "B"
  else if (percent >= 70)  letterGrade <- "C"
  else if (percent >= 60)  letterGrade <- "D"
  else letterGrade <- "F"
  letterGrade
}

#Add up total points earned
totalScore <- function(quiz, homework, test){
  total <- quiz + homework + test
  total
}

#Calculate total percent based on total points earned / total points possible * 100
totalPercent <- function(quiz, homework, test, totalPP = 170){
  percent <- (totalScore(quiz, homework, test) / totalPP) * 100
  percent
}


shinyServer(
  function(input, output) {
    output$inputQuiz <- renderPrint({input$quiz})
    output$inputHomework <- renderPrint({input$homework})
    output$inputTest <- renderPrint({input$test})
    output$totalScore <- renderPrint({totalScore(input$quiz, input$homework, input$test)})
    output$totalPercentage <- renderPrint({totalPercent(input$quiz, input$homework, input$test)})
    output$grade <- renderPrint({gradeRisk(input$quiz, input$homework, input$test)})
  }
)
