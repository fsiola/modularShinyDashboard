sourceDir(path = "modules",
          searchedFileName = "OnLoad.R", 
          maxDepth = 2)


server <- function(input, output, session) {
  sourceDir(path = "modules", 
            searchedFileName = "server.R", 
            maxDepth = 3,
            ignoreFolders = c("tests"),
            local = TRUE)
}