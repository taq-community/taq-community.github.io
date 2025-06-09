#!/bin/bash

find "../assets/documents" -type f -name "*.pdf" -print0 | while IFS= read -r -d $'\0' file;
  do 
    FILE_OUT="$(dirname "${file}")/thumbnails/$(basename "${file}" | cut -d. -f1 ).png"; 
    convert "$file"[0] -flatten -density 300 -quality 300  "$FILE_OUT";
done


