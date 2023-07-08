#!/bin/bash

# Source directory
srcdir="/opt/guacamole/extension"

# Scroll through all the files in the directory
for file in "$srcdir"/*; do
    if [ -d "$file" ]; then
        # If it's a directory, compress it using the jar command
        fileName="$(basename "$file")"
		jar cf "$srcdir/$fileName.jar" -C "$file" .
    fi
done

# Create symbolic links to all .jar files
for file in "$srcdir"/*.jar; do
    if [ -f "$file" ]; then
        # If it is a .jar file, creates the symbolic link
        linkName="$(basename "$file").link"
        ln -s "$file" "$1"
    fi
done
