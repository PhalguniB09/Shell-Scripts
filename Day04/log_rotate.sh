#!/bin/bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Usage: $0 <log_directory>"
  exit 1
fi

log_dir=$1

if [ ! -d "$log_dir" ]; then
  echo "Directory does not exist."
  exit 1
fi

COMPRESSED=$(find "$log_dir" -name "*.log" -mtime +7 -exec gzip {} \; -print | wc -l)
echo "Files Compressed: $COMPRESSED"

DELETED=$(find "$log_dir" -name "*.gz" -mtime +30 -delete -print | wc -l)
echo "Deleted Archive Files: $DELETED"
