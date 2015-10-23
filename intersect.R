#' A cheap trick, but not enough people know it!
#' 
#' @param ...   As many intersect-able elements as you wish.
#' @return      Their intersection (or an error, if they can't be intersected)
#'
#' @example intersect(letters[1:3], letters[3:6], letters[2:4])
#' 
#' @seealso base::funprog 
#' @seealso base::intersect
#' 
#' @export
#' 
intersect <- function(...) Reduce(base::intersect, list(...))
