#' Additional operators which I find useful (especially for chaining)
#' 
#' x %i% y == intersect(x, y)
#' x %u% y == union(x, y)
#' 
#' x %u% y == setdiff(x, y)
#' Note that unlike %i% and %u%, %d% is not commutative.
#'
#' x %notin% y == !x %in% y 
#' Note that unlike %i% and %u% (but like %in%), %notin% is not commutative.
#'
#' @param x   the left hand side of x (grapes) y
#' @param y   the right hand side of x (grapes) y
#' 
#' @return    whatever the result of x (grapes) y might be
#' 
#' @aliases Rscripts-operators
#' @rdname  Rscripts-operators
#' @name    Rscripts-operators
NULL


#' @rdname  Rscripts-operators
#' @export
"%notin%" <- function (x, table) match(x, table, nomatch = 0) == 0


#' @rdname  Rscripts-operators
#' @export
"%d%" <- setdiff


#' @rdname  Rscripts-operators
#' @export
"%i%" <- intersect


#' @rdname  Rscripts-operators
#' @export
"%u%" <- union 
