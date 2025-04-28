#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 INPUT_DIR OUTPUT_DIR"
  exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"

echo "INPUT_DIR=\"$INPUT_DIR\""
echo "OUTPUT_DIR=\"$OUTPUT_DIR\""

find "$INPUT_DIR" -type f | while IFS= read -r file; do
  cp "$file" "$OUTPUT_DIR/$(basename "$file")"
done
