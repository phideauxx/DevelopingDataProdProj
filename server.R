library(shiny)

gradeRisk <- function(quiz, homework, test){
  percent <- totalPercent(quiz, homework, test)
  if (percent >= 90)  letterGrade <- "A" 
  else if (percent >= 80)  letterGrade <- "B"
  else if (percent >= 70)  letterGrade <- "C"
  else if (percent >= 60)  letterGrade <- "D"
  else letterGrade <- "F"
  letterGrade
} 
totalScore <- function(quiz, homework, test){
  total <- quiz + homework + test
  total
}
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
