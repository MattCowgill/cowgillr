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
    rio::install_formats()
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
