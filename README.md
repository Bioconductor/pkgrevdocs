<!-- badges: start -->
📦 [Repo](https://github.com/Bioconductor/pkgrevdocs)   
📖 [Book](https://contributions.bioconductor.org) [![deployment](https://img.shields.io/github/actions/workflow/status/Bioconductor/pkgrevdocs/biocbook.yml?label=Book%20deployment)](https://github.com/Bioconductor/pkgrevdocs/actions/workflows/biocbook.yml)  
🐳 [Docker](https://github.com/orgs/Bioconductor/packages/container/package/contributions.bioconductor.org) [![biocbook](https://img.shields.io/github/actions/workflow/status/Bioconductor/pkgrevdocs/biocbook.yml?label=Docker%20image)](https://github.com/Bioconductor/pkgrevdocs/actions/workflows/biocbook.yml)  
<!-- badges: end -->

Bioconductor Packages: Guidelines for Developers and Reviewers
==============================================================

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

[_Bioconductor_](https://bioconductor.org/)'s guide for package development, maintenance, and peer review.
[Read it here](https://contributions.bioconductor.org).

## Contributing

### Suggestions and updates

This book contains our guidelines for packages contributed to the [_Bioconductor_](https://bioconductor.org/) suite of packages.
These guidelines are always a work in progress - corrections, suggestions and general improvements are welcome as [issue submissions in this repository](https://github.com/Bioconductor/pkgrevdocs/issues/new).
Open discussions are welcome in our [Zulip](https://community-bioc.zulipchat.com/).
You can also suggest changes by editing the Quarto (`.qmd`) files under `inst/pages/` and submitting a [pull request](https://github.com/Bioconductor/pkgrevdocs/pulls).
The "Edit this page" link on each book chapter will take you directly to the relevant file on the GitHub repository to make such changes.
Please target your pull requests to the `devel` branch.

### Technical details

The book is a [BiocBook](https://bioconductor.org/packages/BiocBook/): an R package whose vignette renders a [Quarto](https://quarto.org/) book.

* `inst/index.qmd` is the landing page and `inst/pages/` holds the chapters.
* The chapter order and book settings are in `inst/assets/_book.yml`; site settings are in `inst/assets/_website.yml`.
* `docs/` (e.g. the package review checklist) is copied into the deployed site as-is.

Deployment is done via [GitHub Actions](https://github.com/Bioconductor/pkgrevdocs/actions/workflows/biocbook.yml):

* on every push to `devel`, the book is built in a Docker image, the image is pushed to the [GitHub Container registry](https://github.com/orgs/Bioconductor/packages/container/package/contributions.bioconductor.org), and the book is deployed to GitHub Pages;
* pull requests to `devel` build the book without deploying it, and the rendered book is available as a downloadable `book` artifact of the workflow run.

## Testing locally

Please build the book locally before opening a pull request, and while reviewing one.

### Requirements

* [Quarto](https://quarto.org/docs/get-started/). Version 1.11 or later also renders `llms.txt`, as the deployed book does; older versions render the book without it.
* R (>= 4.3) and the book's dependencies, listed in `DESCRIPTION`. From an R console at the root of this repository:

  ```r
  install.packages(c("BiocManager", "remotes"))
  remotes::install_deps(dependencies = TRUE, repos = BiocManager::repositories())
  ```

### Preview while editing

From the root of this repository, run:

```sh
quarto preview inst/
```

This renders the book, opens it in your browser and re-renders each page as you save it.
From an R console, use `BiocBook::preview(BiocBook::BiocBook("."), browse = TRUE, watch = TRUE)`.
To render the book once without the preview server, run `quarto render inst/`.
The rendered book is written to `inst/docs/`, which git ignores.

### Build the package as CI does

The book is rendered as the package vignette, so building the package checks that the whole book renders:

```sh
R CMD build --keep-empty-dirs --no-resave-data .
```

The book ends up under `inst/doc/book/` in the resulting `contributions.bioconductor.org_*.tar.gz`.

### Build the Docker image

To reproduce the GitHub Actions build exactly, including the Bioconductor version and the Quarto release, build the Docker image:

```sh
docker build --build-arg BIOC_VERSION=devel --build-arg QUARTO_VERSION=1.11.5 -t pkgrevdocs .
```

## Original sources

This book is based on contents from the following original sources:

- https://bioconductor.org
- https://bioconductor.org/developers/package-guidelines/

The template used for this book is credited to the book _rOpenSci Packages: Development, Maintenance, and Peer Review_:

- https://devguide.ropensci.org/ (deployed book)
- https://github.com/ropensci/dev_guide (source)
