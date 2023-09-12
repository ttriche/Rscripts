# tim's .Rprofile
#
.First <- function() {
 
  # use bspm for faster updates 
  suppressMessages(bspm::enable())

  # since I'm always on Linux this is a gimme
  Sys.setenv("R_PDFVIEWER"="/usr/bin/evince")

  # use basilisk for this type of stuff going forward 
  # Sys.setenv(TENSORFLOW_PYTHON="/usr/bin/python3.6")

  # choosing a repo gets old in a hurry
  options("repos" = c(CRAN = "http://cran.rstudio.com/"),
                      browserNLdisabled = TRUE,
                      deparse.max.lines = 2)

  # for new package automation:
  options("skeletor.email"="trichelab@gmail.com")
  options("skeletor.name"="Tim Triche, Jr.")
  options("skeletor.github"="trichelab")

  # notes below on why this is done
  if (dir.exists("~/.Rscripts")) {
    for (i in list.files("~/.Rscripts")) {
      # phelp, lsos, print.data.frame, ... 
      source(paste("~/.Rscripts/", i, sep="/"))
    }
  }
  # bonus: even more obviously ghetto after the `Rscripts` package update!

  # bootstrap functions for getting packages set up 
  req <- function(p) require(p, character.only=TRUE) 
  reqInstall <- function(p) { if (!req(p)) install.packages(p); req(p) }

  # if there's a user:
  if (interactive()) {

    reqInstall("utils")
    reqInstall("BiocManager")
  
    # this has been flaky. disabling it.  
    # bridge to system package management
    # library(bspm) # binary packages
    # suppressMessages(bspm::enable())
    # note that this will ask for sudo access in the course of updates

    # "Packages I'd rather not work without" (loosely defined)
    pkgs <- c("useful","gtools","skeletor","tidyverse")
    BiocManager::install(setdiff(pkgs, unique(rownames(installed.packages()))))

    # fix shortcomings
    for (p in pkgs) reqInstall(p)
  
    ## tab-complete library(\t
    rc.settings(ipck=TRUE)

    # should always be the case IMHO
    options("stringsAsFactors" = FALSE)
    options("useFancyQuotes" = FALSE)

    # many thanks to Duncan Murdoch and Ivo Welch
    message("Set options('warn'=2) to stop on warnings...")
    options("warn"=0) ## or =2 to stop on warnings

    # color-code output
    require("colorout") # BiocManager::install("jalvesaq/colorout")
    
    # all set  
    cat("\nWelcome to", R.version.string, "\n")

    # for roxygenise()
    rox <<- roxygen2::roxygenise
    dox <<- devtools::document

    # change some defaults
    options("digits"=9)
    options("max.print"=9999)
    options("pdfviewer"="/usr/bin/evince")
    options("browser"="/opt/google/chrome/chrome")
    options("scipen" = 9999)
    options("prompt"="R> ")
  
    # set up bigrquery 
    # library("bigrquery")
    # billing_project <- is set in ~/.Rscripts/bigquery.R

    # set up plotly 
    # library("plotly")
    # plotly_api_key <- is set in ~/.Rscripts/plotly.R

    library(BiocManager)
    biocLite <- BiocManager::install

  }
}
 
# I like syntax highlighting, too
if (interactive()) {
  lrda <- function(...) list.files(pattern="rda$", ...)
  lrds <- function(...) list.files(pattern="rds$", ...)

  setHook(packageEvent("grDevices", "onLoad"),
          function(...) grDevices::X11.options(type='cairo'))
  options(device='x11')

  local({ 
    options(editor="vim") 
  })
  # options(contrasts=c("contr.sum","contr.poly"))
  # for RM-ANOVA and so forth

  ## like magrittr, but better:
  `|` <- function(x, y) {
    if(is.data.frame(x)) {
      return(eval(call("%.%", substitute(x), substitute(y)), 
                  envir=parent.frame()))
    } else {
      or <- base::"|"
      return( or(x, y) )
    }
  }

  # get or set the DISPLAY environment variable
  getDisp <- function() Sys.getenv("DISPLAY")
  setDisp <- function(x) Sys.setenv("DISPLAY"=x)

  # quote words, like in perl
  qw <- function(...) sapply(match.call()[-1], deparse)

# Now in its own script in Rscripts::phelp
#
# phelp <- function(...) { # {{{ get help for a package
#   help(package=as.character(sapply(match.call()[-1], deparse)[1]))
# } # }}}
#

# Now in its own script in Rscripts::lsos
#
# lsos <- function(..., n=10) { 
#   .ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE, n=n)
# }

  latexify <- function(filebase, pgf=TRUE) { # {{{
    filebase <- gsub(".Rnw","",filebase)
    filebase <- gsub(".rnw","",filebase)
    filebase <- gsub(".tex","",filebase)
    if(pgf) {
      require(pgfSweave)
      pgfSweave(paste(filebase, "Rnw", sep="."))
    } else {
      Sweave(paste(filebase, "Rnw", sep="."))
    }
    system(paste("LaTeXify", paste(filebase, "tex", sep=".")))
  } # }}}

# Now in its own script in Rscripts::print.data.frame
#
# print.data.frame <- function(df) { # {{{
#   if (ncol(df) > 0 && require("IRanges")) {
#     prev.max.print <- getOption("max.print")
#     on.exit(options(max.print=prev.max.print))
#     options(max.print=ncol(df) * 20)
#     x <- capture.output(print(as(df, "DataFrame")))
#     cat(sub("DataFrame", "data frame", x[[1]]), x[-1], sep="\n")
#   } else {
#     base::print.data.frame(df)
#   }
# } # }}}

  # AWS stuff now in ~/.Rscripts/AWS.R

  host <- function() system2("hostname", stdout=T)
}
