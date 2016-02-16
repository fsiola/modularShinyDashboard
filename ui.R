library(shinydashboard)
library(tools)
source("utils.R")

sourceDir(path = "modules",
          searchedFileName = "ui.R", 
          maxDepth = 2)

dashboardPage(
  dashboardHeader(title = "ModularSD"),
  dashboardSidebar(sidebarMenu(evalNames(".*?LinkPage.*"))),
  dashboardBody(tabItems(evalNames(".*?TabPage.*")))
)