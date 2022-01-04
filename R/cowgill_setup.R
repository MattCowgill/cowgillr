#' Setup an R install with my most-used packages and key settings
#'
#' Installs CRAN and GitHub packages, installs rio formats, rsthemes, and
#' fonts.
#'
#' @examples
#' \dontrun{
#' cowgill_setup()
#' }
#' @export

cowgill_setup <- function() {
  cowgill_install_packages()

  if (requireNamespace("rio", quietly = TRUE)) {
    if (interactive()) {
      rio::install_formats(repos = cran_repo(),
                           type = "binary")
    }
  }

  if (interactive()) {
    if (requireNamespace("rsthemes", quietly = TRUE)) {
      rsthemes::install_rsthemes(include_base16 = TRUE)
    }
  }

  if (requireNamespace("extrafont", quietly = TRUE)) {
    print("Importing fonts...")
    suppressMessages(suppressWarnings(
      extrafont::font_import(prompt = FALSE)
    ))
    suppressMessages(suppressWarnings(
      extrafont::loadfonts(quiet = TRUE)
    ))
  }

  cowgill_edit_rprofile()
  cowgill_edit_makevars()
  invisible(TRUE)
}

cran_repo <- function() {
  cran_repo <- getOption("repos")[["CRAN"]]
  if (is.null(cran_repo[1])) {
    cran_repo <- c("https://cran.rstudio.com/")
  }

  names(cran_repo) <- "CRAN"

  cran_repo
}
