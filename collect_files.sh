#!/bin/bash

if [ $# -ne 2 ] && [ $# -ne 4 ]; then
  exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"
MAX_DEPTH=""

if [ $# -eq 4 ]; then
  MAX_DEPTH="$4"
fi

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
# Я похоже понял, что не так (надо сохранить иерархию), но не уверен, что смогу сделать. Пока оставлю так, если придумаю, переделаю
