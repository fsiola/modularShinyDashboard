HelloWorldLinkPage <- menuItem("HelloWorldLinkPage", tabName = "HelloWorldTabPage", icon = icon("dashboard"))

HelloWorldTabPage <- tabItem(tabName = "HelloWorldTabPage",
                             fluidRow(
                               box(plotOutput("HelloWorldPlot", height = 250)),
                               box(
                                 title = "Controls",
                                 sliderInput("HelloWorldSlider", "Number of observations:", 1, 100, 50)
                                 )
                               )
                             )