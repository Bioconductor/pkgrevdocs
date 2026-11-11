## Add BiocBook context (book package, Docker image, python environment, other
## versions) to the `llms.txt` this book serves: see `?BiocBook::enrich_llms_txt`.
## This must never break the book build: it does nothing if BiocBook (>= 1.11.2)
## is not installed, and only reports a failure.
if (requireNamespace("BiocBook", quietly = TRUE) &&
    exists("enrich_llms_txt", envir = asNamespace("BiocBook"), inherits = FALSE)) {
    tryCatch(
        BiocBook::enrich_llms_txt(Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR", "docs")),
        error = function(e) message("BiocBook could not update llms.txt: ", conditionMessage(e))
    )
}
