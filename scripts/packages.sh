#!/bin/bash

# Run the pacman command and save the output to a variable
pkgs=$(pacman -Sgg | grep blackarch)

# Create an empty markdown list
echo -e "# BlackArch packages\n" > packages.md

# Loop through the packages
while read -r pkgname pkgver pkgdesc groups url; do
  echo "* **$pkgname** - $pkgdesc" >> packages.md
  echo "  - Version: $pkgver" >> packages.md
  echo "  - URL: $url" >> packages.md
done <<< "$pkgs"
