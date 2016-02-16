output$HelloWorldPlot <- renderPlot({
  data <- HelloWorldHistdata[seq_len(input$HelloWorldSlider)]
  hist(data)
})