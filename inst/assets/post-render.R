## Tidy the `llms.txt` that quarto renders (plain page titles, `<page>.md`
## copies of each page, the book summary): see `?BiocBook::enrich_llms_txt`.
## It also adds a BiocBook context block (install command, Docker image,
## versioned copies of the book) that does not apply to this book, which is
## deployed once, at https://contributions.bioconductor.org: remove it.
## This must never break the book build: it does nothing if BiocBook (>= 1.11.2)
## is not installed, and only reports a failure.
if (requireNamespace("BiocBook", quietly = TRUE) &&
    exists("enrich_llms_txt", envir = asNamespace("BiocBook"), inherits = FALSE)) {
    tryCatch({
        output_dir <- Sys.getenv("QUARTO_PROJECT_OUTPUT_DIR", "docs")
        llms_txt <- BiocBook::enrich_llms_txt(output_dir)
        lines <- readLines(llms_txt, warn = FALSE, encoding = "UTF-8")
        start <- grep("<!-- biocbook:start -->", lines, fixed = TRUE)
        end <- grep("<!-- biocbook:end -->", lines, fixed = TRUE)
        if (length(start) == 1L && length(end) == 1L && start < end) {
            drop <- start:end
            ## and the blank line that followed the block
            if (end < length(lines) && !nzchar(lines[end + 1L]))
                drop <- c(drop, end + 1L)
            writeLines(lines[-drop], llms_txt, useBytes = TRUE)
        }
    }, error = function(e) message("Could not tidy llms.txt: ", conditionMessage(e)))
}
