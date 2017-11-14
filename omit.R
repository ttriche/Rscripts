# mostly for e.g. colnames(foo) <- omit(colnames(foo), "_stringent_FACS_", " ")
omit <- function(x, y, z="") base::sub(y, z, x)
