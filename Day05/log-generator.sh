#!/bin/bash
# Usage: ./log_analyzer.sh <log_file_path> <num_lines>

if [ $# -ne 2 ];then
	echo "Usage: ./log-analyzer.sh <log_file_path> <num_lines>"
	exit 1
fi

log_file=$1
num_lines=$2

#if [ -e $log_file ];then
#	echo "file already exists at path $log_file"
#	exit 1
#fi

log_levels=("ERROR" "INFO" "DEBUG" "WARNING" "CRITICAL")
error_messages=("Failed to connect" "Disk full" "Segmentation Fault" "Invalid input" "Out of memory")

generate_log_line(){
	local log_level="${log_levels[$((RANDOM % ${#log_levels[@]}))]}"
	local error_msg=""
	if [ "$log_level" == "ERROR" ]; then
        	error_msg="${error_messages[$((RANDOM % ${#error_messages[@]}))]}"
    	fi
	echo "$(date '+%Y-%m-%d %H:%M:%S') [$log_level] $error_msg - $RANDOM"
}

touch "$log_file"

for ((i=0;i<num_lines;i++));do
	generate_log_line >> "$log_file"
done

echo "log file created at $log_file with $num_lines lines"
