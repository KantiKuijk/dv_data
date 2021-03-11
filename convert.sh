#!/bin/bash
find xlsx -type f -printf "%f\n"| sed 's/\.[^.]*$//' | while read -d $'\n' file
do
    echo "converting $file"
    xlsx2csv "xlsx/$file.xlsx" --all -p '' -f '%Y-%m-%d' -t '%H:%M:%S' > "csv/$file.csv"
    sed -i '2,${/^Filiaal\|^,/d;}' "csv/$file.csv"
done