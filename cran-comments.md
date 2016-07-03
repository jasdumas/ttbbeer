# cran-comments.md

## Test environments
* local Mac OS install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.1.2
* win-builder via devtools::build_win()

## R CMD check results
There were no ERRORs or WARNINGs.

0 errors | 0 warnings | 1 notes

There was 1 NOTE:

* This is my first submission to CRAN so one note may arise from that. Everything else has been satisfied and no other NOTEs appear.

Additional Comments:
* TTB is not a misspelling but an acronym.
* The URL and BugReports links to the github repository.

## Release Commentary

* 2016-07-03: Per reviewer feedback I'm am providing a different and valid link in the source section of the beermaterials.R as the original link produced errors and certificate authencity. This new link actually supports the motivation for this data package as the page says the data is in HTML format when in fact the data is in PDF format. I have also reported a data issue to the data.gov site and request the correct format be specified on the site to eliminate confusion.


