#' evaluates enviroment variables based on a given pattern name
#'
#' @param pattern pattern to search in the enviroment
#' @param envir current enviroment
evalNames <- function(pattern, envir = globalenv()) {
  sapply(ls(pattern = pattern,
            envir = envir),
         FUN = function(variableName) {
           get(variableName, envir = parent.frame())
         },
         simplify = FALSE)
}

#' this function overrides tabItems from shinyDashboard so 
#' it can work correctly with evalNames function
tabItems <- function(...) {
  div(class ="tab-content", ...)
}


#' recursive load file in directory
#'
#' @param path folder being evaluated
#' @param searchedFileName desired filename
#' @param maxDepth max depth of folders
#' @param depth current depth
#' @param ignoreFolders vector containing folders to ignore (eg. "tests")
#' @param local same parameter from source function (TRUE, FALSE or an environment, determining where the parsed expressions are evaluated. FALSE (the default) corresponds to the user's workspace (the global environment) and TRUE to the environment from which source is called.)
sourceDir <- function(path, searchedFileName = NULL, maxDepth = 1, depth = 0, ignoreFolders = c(""), local = FALSE) {
  if (depth != maxDepth) {
    for (fileName in list.files(path)) {
      fullPath <- file.path(path, fileName)
      
      if (file.info(fullPath)$isdir) {
        if (!(fileName %in% ignoreFolders)) {
          if(is.logical(local) && local == TRUE) {
            local = parent.frame() # saving caller enviroment
          }
            
          sourceDir(fullPath, searchedFileName, maxDepth, depth + 1, ignoreFolders, local) #recursive call
        }
      } else {
        if (is.null(searchedFileName) && file_ext(fullPath) == 'R') {
          source(fullPath, local = local)
        } else if(fileName == searchedFileName) {
          source(fullPath, local = local)
        }
      }
    }
  }
}