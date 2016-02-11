tabItems <- function(...) {
  div(class ="tab-content", ...)
}

evalNames <- function(pattern, envir = globalenv()) {
  
  sapply(ls(pattern = pattern,
            envir = envir),
         FUN = function(variableName) {
           get(variableName, envir = parent.frame())
         },
         simplify = FALSE)
}

sourceFile <- function(path, fileName, searchedFileName, maxDepth, depth, onlyLastDepth, local = FALSE) {
  shouldSource <- if (onlyLastDepth && depth + 1 == maxDepth) 
    TRUE
  else if (onlyLastDepth && depth + 1 != maxDepth)
    FALSE
  else
    TRUE
  
  fullPath <- file.path(path, fileName)
  
  if (file_ext(fullPath) == 'R') {
    if (is.null(searchedFileName) && shouldSource) {
      source(fullPath, local = local)
    } else if(fileName == searchedFileName && shouldSource) {
      source(fullPath, local = local)
    }
  }
}

sourceDir <- function(path, searchedFileName = NULL, maxDepth = 1, depth = 0, onlyLastDepth = FALSE, ignoreFolders = c(""), local = FALSE) {
  
  if (depth != maxDepth) {
    for (fileName in list.files(path)) {
      fullPath <- file.path(path, fileName)
      
      if (file.info(fullPath)$isdir) {
        if (!(fileName %in% ignoreFolders)) {
          if(is.logical(local) && local == TRUE) {
            local = parent.frame() # saving caller enviroment
          }
            
          sourceDir(fullPath, searchedFileName, maxDepth, depth + 1, onlyLastDepth, ignoreFolders, local)
        }
      } else {
        sourceFile(path, fileName, searchedFileName, maxDepth, depth, onlyLastDepth, local)
      }
    }
  }
}