# Package Review Checklist {#review-checklist}

**Version 2.0.0**

This checklist is intended to aid and guide the reviewer through the review process.
The individual checkboxes match the package review criteria [listed here](https://contributions.bioconductor.org/).
The package review itself (including additional comments) should be posted in the corresponding issue on the submission tracker.

Reviewers should be respectful and kind to the authors in the review process.
Following the code of conduct is mandatory for everyone involved in the review process.
Emphasis should be put on interoperability of the package and the re-use of code, concepts and classes from existing Bioconductor packages where it makes sense.
The functionality should be sufficiently documented in man pages with runnable examples and package vignette(s).

*package name*:
*link to issue*:

## Package name

- [ ] Package name complies the criteria listed on the [Package name section](https://contributions.bioconductor.org/package-name) of the development guide.

## General package development

- [ ] `R CMD build` without errors, warnings and notes. Any not fixed should be justified. 
- [ ] Package passes `BiocCheck::BiocCheck()`, `BiocCheck::BiocCheckGitClone()`. Any not fixed should be justified.
- [ ] File names. Do not use filenames that differ only in case, as not all file systems are case-sensitive.
- [ ] Package size. Size of tarball <= 10MB.
- [ ] `R CMD check --no-build-vignettes` within 10 minutes.
- [ ] Memory requirement below 8GB.
- [ ] Size of individual files <= 5MB.
- [ ] Undesirable files. System files like `.DS_Store`, `*.so`, etc. should not be included (see [.gitignore](https://contributions.bioconductor.org/gitignore.html) for a listing)
- [ ] No renv directory or renv.lock file present. Packages need to work with current version of Bioconductor and packages. 

## Important Bioconductor Features

- [ ] `biocViews` included in the DESCRIPTION and are valid, relevant, and descriptive to the package. They should come from only 1 main category (software, data experiment, annotation, workflow)
- [ ] Contains a Vignette with executed code.

## Common Bioconductor Methods and Classes

- [ ] Reuse of [common Bioconductor methods and classes](https://contributions.bioconductor.org/reusebioc.html#reusebioc) when appropriate
- [ ] Indication of how package functionality can be integrated into a Bioconductor pipeline/workflow typically in vignette intro

Example: Seurat and data.frames are not Bioconductor classes. Packages certainly
may keep this interoperability and generality but they should also be able to work
_directly_ with the equivalent Bioconductor class in this case likely a SummarizedExperiment or
SingleCellExperiment (maybe with a designed wrapper function, e.g). The majority
of documentation and runnable code should emphasize/demonstrate the interaction
with Bioconductor objects (it may be in addition to the others capabilities).


## README file

Not required but often useful. If included:

- [ ] Include Bioconductor installation instructions
- [ ] If using Rmd, installation sections should be in `eval=FALSE`

## The DESCRIPTION file

Refer to the [DESCRIPTION](https://contributions.bioconductor.org/description.html) section in the BioC package guideline for details on the individual points.

- [ ] `Package` field.
- [ ] `Title` field.
- [ ] `Version` field.
- [ ] `Description` field. Longer than three lines.
- [ ] `Authors@R` field.
- [ ] `License` field. Bioconductor only accepts Open Source Licenses ideally from: https://www.r-project.org/Licenses/
- [ ] `LazyData` field. Justify if `LazyData: TRUE` 
- [ ] `Depends`, `Imports`, `Suggests`, `Enhances` fields. All dependencies must be on CRAN or Bioconductor
- [ ] `SystemRequirements` field. If applicable should also have INSTALL file.
- [ ] `biocViews` field.
- [ ] `BugReports` field.
- [ ] `URL` field.
- [ ] `Video` field. Optional.
- [ ] `Collate` field. Optional.
- [ ] `BiocType` field. (one of: Software, ExperimentData, Annotation, Workflow, Book)
- [ ] `Config/Bioconductor/UnsupportedPlatforms`. Optional. If package designed NOT to work on a specific OS
- [ ] Use of Remotes is NOT allowed. All packages must be on CRAN/Bioconductor

N.B. Authors@R:

- [ ] Use of Authors@R should be used instead of individual Maintainer and Author
fields. While its not wrong to use Maintainer/Author, Authors@R should be
strongly encouraged. Using both Authors@R and Maintainer/Author is not allowed!

- [ ] It is strongly encouraged to include a `fnd` entry in Authors@R with any
  relevant Grant Ids to trace funding activities. Not required but encouraged.

## The NAMESPACE file

- [ ] Function names use `camelCase` or `snake_case` and do not include `.`. `.` indicates hidden or S3 dispatch functions
- [ ] Selective imports using `importFrom` instead of *import all* with `import`. Except where appropriate (like class structures and extensions or heavily utilized packages)
- [ ] Individual functions/methods are exported instead of regular expression matching all.
- [ ] NAMESPACE and DESCRIPTION Depends/Imports/Suggests/Enhances consistency.
- [ ] Avoid names of packages, functions, and classes that already exist in Bioconductor infrastructure or could be easily confused

## The NEWS file

- [ ] News file in correct location and format. See https://contributions.bioconductor.org/news.html

## The CITATION file

- [ ] Citation file (if present) in correct format (`readCitationFile("inst/CITATION")` without package being loaded).

## INSTALL file

If applicable:

- [ ] If Requires System Dependencies, indicates installation instructions on all platforms

## Documentation

### Vignette

- [ ] Vignette present and does describe the core functionality of the package.
- [ ] Vignette uses `BiocStyle` package for formatting. Strongly encourage rendering as html (over pdf, etc)
- [ ] Vignette has an *Introduction* section. This should include motivation for inclusion to Bioconductor and review/comparison to other packages with similar functionality or scope
- [ ] Vignette has an *Installation* section.
- [ ] Vignette has a table of contents.
- [ ] No disabled code blocks present in vignette. If included, should be minimal and justified.
- [ ] Vignette shows interaction with Bioconductor objects or how to integrate into analysis 
- [ ] Ensure any hidden code blocks will not affect end user reproducibility running rendered vignette 
- [ ] Vignette includes `sessionInfo()`.
- [ ] The `vignettes/` directory contains only vignette file(s) and necessary static images. Rendered products (html, pdf, etc. should not be included)

N.B. Sweave vignettes, while not wrong, are not encouraged. Rmd or Qmd conversion should be
strongly recommended.


### Man Pages

- [ ] All exported functions and classes have a man page.
- [ ] Package level man page present.
- [ ] All man pages have runnable examples.
- [ ] Data man pages should indicate how it was generated and relevant source/licensing if relevant

## Package data

### Included in package

- [ ] Included data not too large. Need for separate data package?
- [ ] Exported data and the `data/` directory has correct format, is compressed and well documented.
- [ ] Raw data in `inst/extdata/` directory. Small enough to justify inclusion in package? Equivalent `inst/script/` file that indicates how it was generated and relevant source and licensing information

### Downloaded from web:

- [ ] really necessary? `BiocFileCache` or other caching mechanism used?
- [ ] check licensing of database or api utilized to ensure open source. This should be well documented in vignette/man pages if different from package license to ensure appropriate usage.
- [ ] data should NOT be hosted at individual locations. Dropbox, Github, Google Drive, etc is not allowed.  Recommended hosting location: Zenodo, dryad, Institution server, directly accessed from well established location (ensembl, etc)

## Unit tests

- [ ] Unit tests present and covering large part of core functionality. (recommend testing with `covr::package_coverage()`)

## R code

- [ ] All included code under open source license.
- [ ] No warnings or errors in `R CMD check`.
- [ ] No warnings or errors in `BiocCheck()`.
- [ ] Coding and syntax:
  - `vapply` instead of `sapply`.
  - `seq_len` or `seq_along` over `1:n`
  - `TRUE`, `FALSE` instead of `T`, `F`.
  - numeric indices.
  - `is()` instead of `class()`.
  - `system2` instead of `system`. And calls are appropriate and safe.
  - no `set.seed()` in any internal code.
  - no `browser()` in any internal code.
  - no `<<-`.
  - no direct slot access with `@` or `slot()` - accessors implemented and used.
  - `<-` instead of `=`.
  - `dev.new()` instead of `x11`.
  - `message()`, `warning`, `stop` instead of `cat`. No `paste0` in these methods.
  - check any download/GET/curl calls. Web data should be trusted site NOT github, dropbox, google drive, etc. see data web section 
  - check any uses of system2 for dangerous calls (rm, unlink, etc)
  - check any install calls that they are not evaluated.
  - no writing to home directory or any user directory without user knowledge. `tempfile()` as default
  - ensure no user setting overwrites (config, set, options, etc) that are not returned to original settings 
  - remove unused/commented code. Comments should be explanatory only
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

- [ ] Recommend using Rcpp
- [ ] Internal functions from R's C library used (e.g. `R_alloc`).
- [ ] C function registration used (See [Registering native routines](https://cran.r-project.org/doc/manuals/R-exts.html#Registering-native-routines)).
- [ ] Checks for user interruption.
- [ ] `Makevars` and `Makefile` within a package.

## Python

- [ ] Make use of basilisk or reticulate to manage python dependencies

## Third-party code

- [ ] Inclusion of third-party code follows the [guideline](https://contributions.bioconductor.org/other-than-Rcode.html#third-party-code).
- [ ] Ensure licenses permits redistribution

## Shiny apps

- [ ] All relevant R-code is in the main `R/` directory of the package.
- [ ] Core package code **outside** of the Shiny app.
- [ ] Must still include testing

N.B.  See https://contributions.bioconductor.org/shiny.html


## Unacceptable files

- [ ] No *unacceptable* files present. (see [.gitignore](https://contributions.bioconductor.org/gitignore.html) for a listing)


## Additional Comments or Concerns:
