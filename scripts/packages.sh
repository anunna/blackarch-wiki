#!/bin/bash

# Get the list of package names in the blackarch repository
pacman -Sl blackarch | awk '{print $2}' > packages.txt

# Create the tools.md file with the path $HOME/dev/projects/blackarch-wiki/_wiki/
mkdir -p $HOME/dev/projects/blackarch-wiki/_wiki/tools
touch $HOME/dev/projects/blackarch-wiki/_wiki/tools.md

# Iterate through the list of package names and create individual markdown files for each
while read -r package; do
    # Get the package details from the blackarch repository
    package_details=$(pacman -Si $package | grep -E 'Name|URL|Description|Groups')
    if [ $? -eq 0 ]; then
        # Extract the package name, URL, description and group
        package_name=$(echo $package_details | grep -oP 'Name\s*:\s*\K[^\s]*')
        package_url=$(echo $package_details | grep -oP 'URL\s*:\s*\K[^\s]*')
        package_desc=$(echo $package_details | grep -oP 'Description\s*:\s*\K.*' | cut -d ' ' -f2-)
        package_group=$(echo $package_details | grep -oP 'Groups\s*:\s*\K[^\s]*')
        # Create the individual markdown file with the package name, URL, description, and group
        echo "---" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        echo "name: $package_name" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        echo "url: $package_url" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        echo "description: $package_desc" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        echo "group: $package_group" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        echo "---" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools/$package_name.md
        # Add the package name to the tools.md file
        echo "- [$package_name](/tools/$package_name)" >> $HOME/dev/projects/blackarch-wiki/_wiki/tools.md
        echo "Package $package_name processed successfully"
    else
        echo "Package $package_name failed to process"
    fi
done < packages.txt
