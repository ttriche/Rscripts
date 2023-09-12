options("geo_path"="/home/tim/Dropbox/GEOmetadb")
options("geo_file"="GEOmetadb.sqlite")
options("geo"=with(options(), file.path(geo_path, geo_file)))

getGEOmeta <- function(geo=NULL, verbose=TRUE) {
  library(GEOmetadb)
  if (is.null(geo)) {
    geo <- options()$geo
    if (!file.exists(geo)) {
      stop(paste0(geo, " does not appear to exist."))
    }
  }
  con <- dbConnect(SQLite(), geo)
  if (verbose) message("Connected to ", geo)
  if (verbose) message("columnDescriptions(\"", geo, "\") may help.")
  return(con)
}

getGSEmeta <- function(gse, con) {
  library(dplyr)
  tbl <- tbl(con, "gsm")
  select(filter(tbl, series_id==gse), c("gsm", "title"))
}
