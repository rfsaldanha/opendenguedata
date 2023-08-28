#' Read data from OpenDengue github repository
#'
#' @param extract character. `national`, `spatial` or `temporal`
#' @param columns character vector. Columns names to subset.
#' @param as_data_frame logical. If `TRUE` returns a `tibble` object. If `FALSE` returns an Arrow Table object. Defaults to `FALSE`.
#' @param showProgress logical. Show download bar progress on console.
#' @param cache logical. Use cached data after first download.
#'
#' @return A `data.frame` or an Arrow Table object.
#' @export
#'
#' @examples \dontrun{ if (interactive()) {
#' read_data(extract = "national", as_data_frame = TRUE)
#'}}
read_data <- function(extract, columns = NULL, as_data_frame = FALSE,
                      showProgress = TRUE, cache = TRUE){
  ### Assertions
  checkmate::assert_choice(x = extract, choices = c("national", "spatial", "temporal"))

  ### Extract reference
  if(extract == "national"){
    extract_ref <- national_extract
  } else if(extract == "spatial"){
    extract_ref <- spatial_extract
  } else if(extract == "temporal"){
    extract_ref <- temporal_extract
  }

  ### Download data
  local_file <- download_file(file_url = extract_ref,
                              showProgress = showProgress,
                              cache = cache)

  # check if download worked
  if(is.null(local_file)) { return(NULL) }

  ### read data
  df <- arrow::read_csv_arrow(file = local_file, as_data_frame = FALSE)

  ### Select
  if (!is.null(columns)) {
    df <- dplyr::select(df, dplyr::all_of(columns))
  }

  ### output format
  if (isTRUE(as_data_frame)) {
    return(dplyr::collect(df))
  } else {
    return(df)
  }

}
