Bioconductor Packages: Guidelines for Developers and Reviewers
==============================================================

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) 
[![GitHub Actions](https://github.com/Bioconductor/pkgrevdocs/workflows/build_deploy/badge.svg)](https://github.com/Bioconductor/pkgrevdocs/actions)

[_Bioconductor_](https://bioconductor.org/)'s guide for package development, maintenance, and peer review.
[Read it here](https://bioconductor.github.io/pkgrevdocs/).

## Contributing

### Suggestions and updates

This book contains our guidelines for packages contributed to the [_Bioconductor_](https://bioconductor.org/) suite of packages.
These guidelines are always a work in progress - corrections, suggestions and general improvements are welcome as [issue submissions in this repository](https://github.com/kevinrue/bioc_package_guide/issues/new).
Open discussions are welcome in our [Slack](https://bioc-community.herokuapp.com/).
You can also suggest changes by editing the `.Rmd` files that are at the root of this repository and submitting a [pull request](https://github.com/kevinrue/bioc_package_guide/pulls).
An "Edit this page" link in the side bar on the right of each book chapter will take you directly to the relevant page on the GitHub repository to make such changes.
Please target your pull requests to the `master` branch.

### Technical details

Deployment is done via [GitHub Actions](https://github.com/kevinrue/bioc_package_guide/actions):

* whenever there's a push to `master`, the book is built and its content is then pushed to the `gh-pages` branch.

To preview the book locally - preferably before opening a pull request and while reviewing it - use the following code in an R console with the working directory set to the root of this repository, making sure that all the dependencies of the book are available (see file `DESCRIPTION`).

```r
bookdown::render_book()
```

We recommend using [renv](https://rstudio.github.io/renv/articles/renv.html) to restore the package environment for this project from the `renv.lock` file in this repository, using the the following command:

```r
renv::restore()
```

## Original sources

This book is based on contents from the following original sources:

- https://bioconductor.org
- https://bioconductor.org/developers/package-guidelines/

The template used for this book is credited to the book _rOpenSci Packages: Development, Maintenance, and Peer Review_:

- https://devguide.ropensci.org/ (deployed book)
- https://github.com/ropensci/dev_guide (source)
