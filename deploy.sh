#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Genterate file statis
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# pindah ke direktoru publik
cd brothercode
# tambahkan perubahan ke Git
git add -A

# Buat sebuah commit baru
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push atau puload ke Github
git push origin master

# Balik ke direktori sebelumnya
cd ..

echo "# brothercode" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/nofegreen/brothercode.git
git push -u origin master