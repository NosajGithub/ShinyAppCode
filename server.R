library(shiny)
library(ggplot2)

data <- read.csv("DeptData.csv")

shinyServer(function(input, output) {
        
#        get(load("savedData.RData"))
        
        dataset <- reactive(
                subset(data,DepartmentLong == input$department)
        )
        
        output$plot <- renderPlot({                
                p <- ggplot(dataset(), aes_string(x="Year", y=input$gOrE)) + geom_line(color = "darkgrey") + 
                        geom_point(colour = "darkgreen", size = 5) + 
                        geom_text(aes_string(label=input$gOrE), vjust=-2) + 
                        scale_x_continuous(breaks=unique(dataset()$Year)) +
                        theme_bw()
                
                print(p)
                
        }, height=500)
        
})