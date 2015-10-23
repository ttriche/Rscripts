#' Additional operators which I find useful (especially for chaining)
#' @alias additionalOperators 
NULL

#' x %notin% y == !x %in% y 
#' Note that, unlike %i% and %u%, but like %in%, %notin% is not commutative.
#' 
#' @describeIn operators
#' @export
#' 
"%notin%" <- function (x, table) match(x, table, nomatch = 0) == 0

#' x %u% y == setdiff(x, y)
#'
#' Note that, unlike %i% and %u%, %d% is not commutative.
#' 
#' @describeIn operators
#' @export
#' 
"%d%" <- setdiff

#' x %i% y == intersect(x, y)
#' 
#' @describeIn operators
#' @export
#' 
"%i%" <- intersect

#' x %u% y == union(x, y)
#' 
#' @describeIn operators
#' @export
#' 
"%u%" <- union 
