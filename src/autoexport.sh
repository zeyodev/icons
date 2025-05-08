#!/bin/bash

# generate-exports.sh
# Usage: ./generate-exports.sh [input_dir] [output_file]

INPUT_DIR=${1:-"business_and_online_icons"}
OUTPUT_FILE=${2:-"index.ts"}

echo "// Auto-generated exports ($(date))" > $OUTPUT_FILE

find $INPUT_DIR -name '*.ts' | while read -r file; do
    # Get filename without extension
    filename=$(basename -- "$file" .ts)
    
    # Remove "icons" prefix and convert to PascalCase
    export_name=$(echo $filename | sed 's/^icons//' | sed 's/\(^\|_\)\([a-z]\)/\1\U\2/g' | sed 's/_//g')
    
    # Get relative path without extension
    relative_path="${file%.ts}"
    
    echo "export { default as $export_name } from './$relative_path';" >> $OUTPUT_FILE
done

echo "Generated exports in $OUTPUT_FILE"