# DrugBase

DrugBase is a library of YAML files containing detailed drug information for medication used in critical care environments.

The repository is designed primarily to make my life easier by providing a single point of reference for my other educational projects, namely Part One and the Bedside Notebook.


## Structure

The `/drugs` directory contains a separate YAML file for each agent. Named properties should be structured as a dictionary (a key-value pair, without a leading `-`) so they can be addressed by name in R (e.g. `adrenaline$dose$arrest`), unnamed properties should be structured as arrays (leading `-`).

The `/database` directory contains the full database of drugs in the following output formats:

* Rdata
* JSON

## Running

YAML validation can be performed from terminal with `Rscript checkYAML.R`.

The database can be re-built using `Rscript buildYAML.R`