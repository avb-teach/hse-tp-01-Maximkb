#!/bin/bash

if [ $# -ne 2 ] && [ $# -ne 3 ]; then
  echo "Usage: $0 INPUT_DIR OUTPUT_DIR [MAX_DEPTH]"
  exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"
MAX_DEPTH=""

if [ $# -eq 3 ]; then
  MAX_DEPTH="$3"
fi

echo "INPUT_DIR=\"$INPUT_DIR\""
echo "OUTPUT_DIR=\"$OUTPUT_DIR\""
echo "MAX_DEPTH=\"$MAX_DEPTH\""

if [ -n "$MAX_DEPTH" ]; then
  find "$INPUT_DIR" -maxdepth "$MAX_DEPTH" -type f | \
    while IFS= read -r file; do
      cp "$file" "$OUTPUT_DIR/$(basename "$file")"
    done
else
  find "$INPUT_DIR" -type f | \
    while IFS= read -r file; do
      cp "$file" "$OUTPUT_DIR/$(basename "$file")"
    done
fi
