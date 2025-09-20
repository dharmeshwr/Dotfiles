#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="$timestamp.txt"

# Exclude patterns for binary/media files
exclude_patterns=(
  # images
  "*.png" "*.jpg" "*.jpeg" "*.gif" "*.bmp" "*.tiff" "*.ico" "*.svg" "*.webp"
  # audio
  "*.mp3" "*.wav" "*.ogg" "*.flac" "*.aac" "*.m4a"
  # video
  "*.mp4" "*.mkv" "*.avi" "*.mov" "*.wmv" "*.flv" "*.webm"
  # fonts
  "*.ttf" "*.otf" "*.woff" "*.woff2" "*.eot"
  # binaries
  "*.exe" "*.dll" "*.so" "*.bin" "*.dat" "*.class" "*.o" "*.a"
)

# Build exclusion expression for find
exclude_expr=()
for pattern in "${exclude_patterns[@]}"; do
  exclude_expr+=( ! -iname "$pattern" )
done

if [ "$#" -eq 0 ]; then
  # No arguments - find all files in current directory recursively
  input_files=($(find . -type d \( -name node_modules -o -name .git \) -prune -o -type f \
    ! -name "package-lock.json" ! -name "merge" "${exclude_expr[@]}" -print))
else
  # Arguments provided - process each one
  input_files=()
  for arg in "$@"; do
    if [ -d "$arg" ]; then
      echo "Processing directory: $arg"
      while IFS= read -r -d '' file; do
        input_files+=("$file")
      done < <(find "$arg" -type d \( -name node_modules -o -name .git \) -prune -o -type f \
        ! -name "package-lock.json" ! -name "merge" "${exclude_expr[@]}" -print0)
    elif [ -f "$arg" ]; then
      input_files+=("$arg")
    else
      echo "Warning: '$arg' is neither a file nor a directory, skipping..."
    fi
  done
fi

echo "Input files: ${input_files[@]}"
touch "$output_file"
merged_count=0

for input_file in "${input_files[@]}"; do
  echo "Processing file: $input_file"
  if [ -f "$input_file" ] && [ "$input_file" != "$output_file" ]; then
    echo "=========== $input_file ===========" >> "$output_file"
    cat "$input_file" >> "$output_file"
    echo "" >> "$output_file"
    ((merged_count++))
  fi
done

if [ $merged_count -gt 0 ]; then
  echo "Merging complete! $merged_count file(s) merged. Output saved to $output_file."
else
  echo "No files found to merge."
  rm "$output_file"
fi
