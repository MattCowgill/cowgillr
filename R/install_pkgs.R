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

  if (requireNamespace("rsthemes", quietly = TRUE)) {
    rsthemes::install_rsthemes(include_base16 = TRUE)
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
}

cowgill_install_packages <- function(pkg_type = c("cran", "github")) {
  existing_install_option <- getOption("install.packages.check.source")
  options(install.packages.check.source = "no")
  on.exit(options(install.packages.check.source = existing_install_option))

  results <- logical()

  if ("cran" %in% pkg_type) {
    results["cran"] <- cowgill_install_cran_packages()
  }

  if ("github" %in% pkg_type) {
    results["github"] <- cowgill_install_github_packages()
  }

  if (all(results[pkg_type])) {
    invisible(return(TRUE))
  } else {
    stop("Not all packages could be installed")
  }

}

cowgill_install_cran_packages <- function() {

  packages <- c(
    "devtools",
    "usethis",
    "purrr",
    "purrrlyr",
    "tidyverse",
    "fs",
    "gganimate",
    "dtplyr",
    "dbplyr",
    "readxl",
    "extrafont",
    "tsibble",
    "fable",
    "feasts",
    "ggtext",
    "showtext",
    "sysfonts",
    "bookdown",
    "rmarkdown",
    "janitor",
    "countrycode",
    "shadowtext",
    "OECD",
    "datapasta",
    "plotly",
    "padr",
    "ggseas",
    "tsbox",
    "here",
    "readsdmx",
    "microbenchmark",
    "bench",
    "corrr",
    "ggrepel",
    "distill",
    "rsconnect",
    "prompt",
    "ggalt",
    "ggforce",
    "gifski",
    "av",
    "ggiraph",
    "shinyjs",
    "shinydashboard",
    "flexdashboard",
    "tidymodels",
    "broom",
    "profvis",
    "styler",
    "qs",
    "RcppRoll",
    "slider",
    "zoo",
    "sf",
    "rio"
  )

  if (interactive()) {
    remotes::install_cran(pkgs = packages,
                          type = "binary",
                          dependencies = TRUE)
  }

  invisible(return(TRUE))
}

cowgill_install_github_packages <- function() {

  packages <- c(
    "MattCowgill/ggannotate",
    "MattCowgill/readabs",
    "MattCowgill/readrba",
    "MattCowgill/ggrichlegend",
    "MattCowgill/auseconhist",
    "grattan/grattantheme",
    "runapp-aus/strayr",
    "wfmackey/absmapsdata",
    "wfmackey/abscorr",
    "noamross/redoc",
    "gadenbuie/rsthemes"
  )

  out <- remotes::install_github(repo = packages,
         dependencies = TRUE,
         upgrade = "always",
         type = "binary")

  invisible(return(TRUE))
}
