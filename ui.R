library(shiny)
library(ggplot2)

dataset <- read.csv("DeptData.csv")

shinyUI(pageWithSidebar(
        
        headerPanel(
                h2("Average Grade and Enrollment By Department")
                ),
        
        sidebarPanel(
                
                h3("Instructions"),
                p("This app displays the average grade and enrollment data for each of 
                  Dartmouth College's departments, by year. For more information and the source of this data, click",
                a("here", 
                  href = "http://nosajtblr.tumblr.com/post/88108899108/at-dartmouth-grades-are-up-the-humanities-are-down"),
                "."),
                
                br(),
                
                h3("Controls"),
                
                selectInput('department', 'Select a Department', unique(dataset$DepartmentLong),"COSC: Computer Science"),
                
                selectInput('gOrE', 'View Average Grades or Enrollment', c("enrollment","grade"), "grade")
                
                ),
        
        mainPanel(
                plotOutput('plot')
        )
))