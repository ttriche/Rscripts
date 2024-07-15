#' write a table of all current packages to a CSV file
#' 
#' @param filename  filename for the results (default is R.major.minor.pkgs.csv)
#' @param path      path for the results (default is .)
#' 
#' @return          status of writing the file
#'
#' @export
#'
write.packages <- function(filename=NULL, path=".") {

  if (is.null(filename)) {
    filename <- with(R.version, 
                     paste(language, major, minor, "pkgs", "csv", sep="."))
  }
  message("Writing current installed package list to ", filename, "...")
  write.csv(library()$results, file=file.path(path, filename), row.names=FALSE)

}
