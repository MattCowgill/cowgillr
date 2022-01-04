cowgill_edit_rprofile <- function() {

  ask <- ask_yes_no("Update Rprofile?")
  if (ask) {
    rprof_text <- c("if (utils::packageVersion(\"rlang\") > 0.5) {",
                    "  rlang::global_handle()",
                    "}",
                    "",
                    "options(",
                    "  usethis.description = list(",
                    "    `Authors@R` = 'person(\"Matt\", \"Cowgill\"),",
                    "    email = \"mattcowgill@gmail.com\",",
                    "    role = c(\"aut\", \"cre\"),",
                    "    comment = c(ORCID = \"0000-0003-0422-3300\"))',",
                    "    License = \"MIT + file LICENSE\"",
                    "  )",
                    ")",
                    "",
                    "options(usethis.full_name = \"Matt Cowgill\")",
                    "",
                    "options(usethis.protocol = \"ssh\")",
                    "",
                    "options(dplyr.summarise.inform = FALSE)",
                    "",
                    "# ~/.Rprofile",
                    "options(",
                    "  rsthemes.theme_light = \"Textmate (default)\",",
                    "  rsthemes.theme_dark = \"Tomorrow Night Bright\"",
                    ")",
                    "",
                    "if (interactive()) {",
                    "suppressMessages(suppressWarnings(require(devtools)))",
                    "suppressMessages(suppressWarnings(require(testthat)))",
                    "suppressMessages(suppressWarnings(require(usethis)))",
                    "}",
                    "",
                    "# Add Git branch to console",
                    "prompt::set_prompt(function(...){",
                    "  paste0(",
                    "  \"[\", prompt::git_branch(), \"] > \"",
                    "  )",
                    "})")


    rprof_loc <- fs::path(fs::path_home_r(), ".Rprofile")

    proceed <- TRUE

    if (fs::file_exists(rprof_loc)) {
      proceed <- ask_yes_no("Rprofile already exists. Overwite it?")
    }

    if (proceed) {
      cat(rprof_text, sep = "\n", file = rprof_loc)
    }
  }

  if (!proceed) {
    stop("Rprofile not edited")
  } else {
    invisible(return(TRUE))
  }

}
