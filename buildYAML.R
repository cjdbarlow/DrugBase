# This is a simple R script that builds the drug database, if all files are valid YAML

# Libraries
require(yaml)
require(jsonlite)

# Script
## Function to get the YAML content of a file, and abort if it is invalid
getYAML = function(file) {
    tryCatch({
        dir = paste0("drugs/", file, ".yaml")
        content = yaml::read_yaml(dir)
        return(content)
    },
    error = function(e) {
        stop(paste("Invalid YAML file:", file))
    })
}

## Get list of files without the extension, and then get the content of those files
## (Strip out the extension and directory, and add them back in later because it makes the list formed by sapply() pretty)
files = gsub("\\.yaml",
             "",
             list.files("drugs",
                   include.dirs = FALSE))

database = sapply(files, getYAML,
                  simplify = FALSE)


# Save in various output formats
## R Data
saveRDS(database,
        file = "database/drugbase.Rds")

## JSON
databaseJSON = jsonlite::toJSON(database)

if(jsonlite::validate(databaseJSON)) {
    jsonlite::write_json(database,
                         path = "database/drugbase.json")
} else {
    print("JSON not updated: Invalid JSON.")
}


