library(shinydashboard)
library(tools)
source("utils.R")

sourceDir("modules", "ui.R", 2)

dashboardPage(
  dashboardHeader(title = "ModularSD"),
  dashboardSidebar(sidebarMenu(evalNames(".*?LinkPage.*"))),
  dashboardBody(tabItems(evalNames(".*?TabPage.*")))
)