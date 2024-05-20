#' Get example data
#'
#' @param path Path to the example data file.
#' @return Data from the specified file.
#' @examples
#' \dontrun{
#'   deepforestr::get_data("OSBS_029.png")
#' }
#' @importFrom reticulate import r_to_py
#' @export
get_data <- function(path) {
  deepforest$get_data(path)
}

#' Deepforest Model object
#'
#' @return An instance of the Deepforest model.
#' @examples
#' \dontrun{
#'   model <- deepforestr::df_model()
#'   print(model)
#' }
#' @importFrom reticulate import r_to_py
#' @export
df_model <- function() {
  deepforest$main$deepforest()
}

# Global reference to Python modules (will be initialized in .onLoad)
deepforest <- NULL

.onLoad <- function(libname, pkgname) {
  # Assignment in the parent environment
  try({
    deepforest <<- reticulate::import("deepforest", delay_load = TRUE)
    # Optionally check for deepforest availability here
    # check_deepforest_availability()
  }, silent = TRUE)
}
