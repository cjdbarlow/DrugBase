# This is a simple R script that checks that all files in the "drugs" directory are structurally valid YAML
# Libraries
require(yaml)

# Script
## Function to check if a file is valid YAML
isValidYAML = function(file) {
    tryCatch({
        yaml::read_yaml(file)
        TRUE
    },
    error = function(e) {
        FALSE
    })
}

## Get list of files and check results
files = list.files("drugs", full.names = TRUE)

results = sapply(files, isValidYAML)


## Show results
if(length(which(!results)) == 0){
    print("All files are valid YAML!")
    
} else {
    invalid = results[c(which(!results))]
    
    print("The following files are invalid YAML:")
    for(i in 1:length(invalid)){
        # This mess takes the name of the vector at position `i`, removes the directory prefix, and prints the result
        print(gsub("drugs/", "", names(invalid[i])))
    }
}