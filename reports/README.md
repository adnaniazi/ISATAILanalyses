
## R Markdown files

This direcotry contains all the R Markdown files for generating figure
used in the tailfindr manuscript.

When you run `drake::r_make()`, it will first download the data,
consolidate the data, and then knit the R Markdown files – present in
this directory – using the consolidated data. The html output of the R
Markdown files is stored here with the same name as the R Markdown file.

## Modifiying R Markdown file to include custom analyses

After you have successfully run `drake::r_make()`, you can change these
R Markdown files to inlcude custom analyses. To render the modified R
Markdown file, either run `drake::r_make()` again, which will
automatically knit the modified R Markdown file(s), or just use the
‘knit’ option in R Studio.

## What is what

#### 1\. krause\_niazi\_et\_al\_dna\_analysis.Rmd

Contains all the analyses done on our DNA datasets.

#### 2\. krause\_niazi\_et\_al\_rna\_analysis.Rmd

Contains all the analyses done on our RNA datasets.

#### 3\. workman\_et\_al\_rna\_analysis.Rmd

Contains all the analyses done on Workman et al.’s RNA datasets.
