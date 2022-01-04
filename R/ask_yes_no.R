ask_yes_no <- function(question) {
  res <- TRUE
  if (interactive()) {
    res <- utils::askYesNo(question)
  }
  res
}
