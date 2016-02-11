output$HelloWorldPlot <- renderPlot({
  data <- HelloWorldhistdata[seq_len(input$HelloWorldSlider)]
  hist(data)
})