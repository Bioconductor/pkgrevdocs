# Package Review Checklist {#review-checklist}

**Version 1.0.1**

This checklist is intended to aid and guide the reviewer through the review
process.
The individual checkboxes match the package review criteria [listed here](https://contributions.bioconductor.org/).
The package review itself (including comments) should be posted in the corresponding issue on the submission tracker.

Reviewers should be respectful and kind to the authors in the review process.
Following the code of conduct is mandatory for everyone involved in the review process.
Emphasis should be put on interoperability of the package and the re-use of code, concepts and classes from existing Bioconductor packages where it makes sense.
The functionality should be sufficiently documented in man pages with runnable examples and package vignette(s).

*package name*:
*link to issue*:

## General package development

- [ ] `R CMD build` without errors, warnings and notes.
- [ ] Package passes `BiocCheck::BiocCheck()`, `BiocCheck::BiocCheckGitClone()`.
- [ ] File names.
- [ ] Package size.
- [ ] `R CMD check --no-build-vignettes` within 10 minutes.
- [ ] Memory requirement below 3GB.
- [ ] Size of individual files <= 5MB.
- [ ] README file.

## The DESCRIPTION file

Refer to the [DESCRIPTION](https://contributions.bioconductor.org/description.html) section in the BioC package guideline for details on the individual points.

- [ ] `Package` field.
- [ ] `Title` field.
- [ ] `Version` field.
- [ ] `Description` field.
- [ ] `Authors@R` field.
- [ ] `License` field.
- [ ] `LazyData` field.
- [ ] `Depends`, `Imports`, `Suggests`, `Enhances` fields.
- [ ] `SystemRequirements` field.
- [ ] `biocViews` field.
- [ ] `BugReports` field.
- [ ] `URL` field.
- [ ] `Video` field.
- [ ] `Collates` field.
- [ ] `BiocType` field.

## The NAMESPACE file

- [ ] Function names use `camelCase` or `snake_case` and do not include `.`.
- [ ] Selective imports using `importFrom` instead of *import all* with `import`.
- [ ] Individual functions/methods are exported instead of all.

## The NEWS file

- [ ] News file in correct location and format.

## The CITATION file

- [ ] Citation file (if present) in correct format
      (`readCitationFile("inst/CITATION")` without error).
	  
## Package data

- [ ] Included data not too large. Need for separate data package?
- [ ] Exported data and the `data/` directory has correct format, is compressed and documented.
- [ ] Raw data in `inst/extdata/` directory. Small enough to justify inclusion in package?
- [ ] If data downloaded from web: really necessary? `BiocFileCache` used?

## Documentation

- [ ] Vignette present and does describe the core functionality of the package.
- [ ] No disabled code blocks present in vignette.
- [ ] Vignette uses `BiocStyle` package for formatting.
- [ ] Vignette has an *Introduction* section.
- [ ] Vignette has an *Installation* section.
- [ ] Vignette has a table of contents.
- [ ] Vignette includes `sessionInfo()`.
- [ ] The `vignettes/` directory contains only vignette file(s) and necessary static images.
- [ ] All exported functions and classes have a man page.
- [ ] Package man page present.
- [ ] All man pages have runnable examples.

## Unit tests

- [ ] Unit tests present and covering large part of core functionality.

## R code

- [ ] All included code under open source license.
- [ ] No warnings or errors in `R CMD check`.
- [ ] No warnings or errors in `BiocCheck()`.
- [ ] Coding and syntax:
  - `vapply` instead of `sapply`.
  - `TRUE`, `FALSE` instead of `T`, `F`.
  - numeric indices.
  - `is()` instead of `class()`.
  - `system2` instead of `system`.
  - no `set.seed()` in any internal code.
  - no `browser()` in any internal code.
  - no `<<-`.
  - no direct slot access with `@` or `slot()` - accessors implemented and used.
  - `<-` instead of `=`.
  - `dev.new()` instead of `x11`.
  - `message()`, `warning`, `stop` instead of `cat`. No `paste0` in these
    methods.
- [ ] Re-use of classes and functionality (if appropriate).
- [ ] Functional programming: no code repetition.
- [ ] No excessively long functions.
- [ ] Function argument names descriptive and documented.
- [ ] Function arguments should have defaults.
- [ ] Function arguments are tested for validity.
- [ ] Vectorize: no unnecessary `for` loops present.
- [ ] Web resources follow the guideline [Querying Web Resources](http://bioconductor.org/developers/how-to/web-query/).
- [ ] Parallelisation uses `BiocParallel`.
- [ ] Downloaded files cached with `BiocFileCache`.
- [ ] Additional files and dependencies: nothing installed on a user's system.

## C and Fortran code

- [ ] Internal functions from R's C library used (e.g. `R_alloc`).
- [ ] C function registration used (See [Registering native routines](http://cran.fhcrc.org/doc/manuals/R-exts.html#Registering-native-routines).
- [ ] Checks for user interruption.
- [ ] `Makevars` and `Makefile` within a package.

## Third-party code

- [ ] Inclusion of third-party code follows the [guideline](https://contributions.bioconductor.org/third-party-code.html).

## Shiny apps

- [ ] All relevant R-code is in the main `R/` directory of the package.
- [ ] Core package code **outside** of the Shiny app.

## Unacceptable files

- [ ] No *unacceptable* files present (see [.gitignore](https://contributions.bioconductor.org/gitignore.html) for a listing).
