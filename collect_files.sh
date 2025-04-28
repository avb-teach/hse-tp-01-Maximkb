#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 MAX_DEPTH INPUT_DIR OUTPUT_DIR"
  exit 1
fi

MAX_DEPTH="$1"
INPUT_DIR="$2"
OUTPUT_DIR="$3"

echo "MAX_DEPTH=\"$MAX_DEPTH\""
echo "INPUT_DIR=\"$INPUT_DIR\""
echo "OUTPUT_DIR=\"$OUTPUT_DIR\""

find "$INPUT_DIR" -maxdepth "$MAX_DEPTH" -type f | while IFS= read -r file; do
  cp "$file" "$OUTPUT_DIR/$(basename "$file")"
done
