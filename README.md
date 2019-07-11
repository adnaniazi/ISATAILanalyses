
[![Last-changedate](https://img.shields.io/badge/last%20change-2019--06--07-brightgreen.svg)](https://github.com/pat-s/pathogen-modeling/commits/master)
[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.6.0-brightgreen.svg)](https://cran.r-project.org/)
[![Licence](https://img.shields.io/github/license/mashape/apistatus.svg)](http://choosealicense.com/licenses/mit/)

## Reproducible analysis for paper:

#### [tailfindr: Alignment-free poly(A) length measurement for Oxford Nanopore RNA and DNA sequencing](https://www.biorxiv.org/content/10.1101/588343v2)

Maximilian Krause, Adnan M. Niazi, Kornel Labun, Yamila N. Torres
Cleuren, Florian S. Müller, Eivind Valen

## About the repo

This repository is roughly organized as an R package – but is not an R
package per se – providing functions and the raw data to reproduce and
extend the analyses reported in the publication. By raw data, we mean
the output of tools such as tailfindr and Nanopolish etc.

This project is setup with a drake workflow, ensuring reproducibility.
Intermediate targets/objects will be stored in a hidden .drake
directory.

The R library of this project is managed by packrat. This makes sure
that the exact same package versions are used when recreating the
project.

Please note that this project was built with R version 3.6.0 on a MAC
OSx Mojave operating system. The packrat packages from this project are
not compatible with R versions prior version 3.6.0 (In general, it
should be possible to reproduce the analysis on any other operating
system.)

## Pre-requisites

Before starting, please ensure that you have:

1.  A working installation of git

2.  R (version *3.6.0* or above)

3.  A working installation of pandoc. You can install it using
    instructions [here](https://pandoc.org/installing.html).

## Getting started

To clone the project, open a terminal in the directory of your choice
and execute:

``` sh
git clone https://github.com/adnaniazi/krauseNiazi2019Analyses.git
```

Then go into the `krauseNiazi2019Analyses` directory using:

``` sh
cd krauseNiazi2019Analyses
```

Now start R in this location in the terminal:

``` sh
R
```

Now in R console,
type:

``` r
# restore all R packages with their specific version (won't run in R < 3.6.0)
packrat::restore() 
```

Next execute:

``` r
drake::r_make()    # recreates the analysis
```

This command will do a series of steps:

1.  It will download outputs of tailfindr, Nanopolish, barcode
    assignment, eGFP alignment results for DNA and RNA data (both us and
    Workman et al.’s) as `.csv` files in the `data` folder. This step
    may take some time as these files are large. All the scripts that
    generated these `csv` files are present in the `scripts` folder. You
    can use these scripts manually yourself if you want to start working
    your way up from Fast5 files. However, for the sake of ease and
    saving time, we have already generated the results of these scripts
    and will download these pre-computed results to the `data`
    directory. The data directory has a README file containing detailed
    information about each file and their respective columns.

2.  Once all csv files are downloaded, they are consolidated into
    dataframes. The code that does this is located in the `R` directory.
    This step results in three dataframes: `rna_kr_data`, `dna_kr_data`,
    `rna_wo_data` corresponding to RNA data of Krause/Niazi et al, DNA
    data of Krause/Niazi et al, and RNA data of Workman et
    al. respectively. You can access these datasets manually – if you
    wish so – by using drake’s `loadd` command.

3.  Using `rna_kr_data`, `dna_kr_data`, `rna_wo_data` datasets, three R
    Markdown files (`krause_niazi_et_al_rna_analysis.Rmd`,
    `krause_niazi_et_al_dna_analysis.Rmd`,
    `workman_et_al_rna_analysis.Rmd`) located in the `reports` directory
    are knit. These R Makrdown files contain the code for all the
    figures used in the manuscript. The html outputs of these R Markdown
    files are generated in the `reports` directory. Go to `report`
    directory and open these html files to view the rendered report.

If you want to extend the analysis, then open the R Markdown file, edit
it, and re-knit it in RStudio. You will need to open
`krauseNiazi2019Analyses` directory as a project in R-studio. The
knitting should work – provided steps 1 and 2 have been executed without
any errors. Alternatively, you can also run `drake::r_make()`, and it
will automatically run anything that has changed downstream of whatever
you changed.

## What is what?

##### R

Contains helper functions for downloading the data and consolidating
them.

##### code

Contains calls to helper functions in the `R` directory.

##### data

Contains all the data generated by tailfindr, Nanopolish etc as csv
files. These file are downloaded once `drake::r_make()` is run as
mentioned above.\`

##### scripts

Contains scripts that generated the data in the `data` directory. These
scripts are not run at any point in the analyses done here; they have
been provided only for reference.

##### reports

Contains R Markdown files and their knitted html versions.

##### man

Contains documentation of functions in `R` directory.