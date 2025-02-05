#!/bin/bash

# Capture any filenames with whitespace
bad_files=()

for file in "$@"; do
    if [[ "$file" =~ \  ]]; then
        bad_files+=("$file")
    fi
done

# If any bad filenames were found, block the commit
if [[ ${#bad_files[@]} -gt 0 ]]; then
    echo -e "\n🚨 ERROR: The following files contain whitespace in their names:"
    for file in "${bad_files[@]}"; do
        echo "  - $file"
    done
    echo -e "\n❗ Please rename them using one of the following methods:\n"
    echo "   🔹 Remove spaces: mv 'file with spaces.txt' 'filewithspaces.txt'"
    echo "   🔹 Use underscores: mv 'file with spaces.txt' 'file_with_spaces.txt'"
    echo "   🔹 Manually rename: mv 'file with spaces.txt' 'your_choice.txt'"
    echo -e "\nAfter renaming, re-add the files using: git add <new_file> and commit again.\n"
    exit 1  # Block the commit
fi

exit 0  # Allow commit if no issues
