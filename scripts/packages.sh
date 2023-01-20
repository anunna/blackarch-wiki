#!/bin/bash

# Run the pacman command and save the output to a variable
pkgs=$(pacman -Sgg | grep blackarch)

# Loop through the packages
while read -r pkgname pkgver pkgdesc groups url; do
  # Create a new markdown file for each package
  echo -e "# $pkgname\n" > _wiki/tools/$pkgname.md

  # Add the package details to the file
  echo "## Version" >> _wiki/tools/$pkgname.md
  echo "$pkgver" >> _wiki/tools/$pkgname.md
  echo "## Description" >> _wiki/tools/$pkgname.md
  echo "$pkgdesc" >> _wiki/tools/$pkgname.md
  echo "## Group" >> _wiki/tools/$pkgname.md
  echo "$groups" >> _wiki/tools/$pkgname.md
  echo "## URL" >> _wiki/tools/$pkgname.md
  echo "$url" >> _wiki/tools/$pkgname.md
done <<< "$pkgs"
