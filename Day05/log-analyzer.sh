#!/bin/bash
# Usage: ./log_analyzer.sh <log_file_path>

if [ $# -ne 1 ];then
	echo "Usage: ./log_analyzer.sh <log_file_path>"
	exit 1
fi

log_file=$1

if [ ! -e $log_file ];then
 	echo "file doensnt exist"
	exit 1
fi

DOA=$(date "+%Y-%m-%d")
report_file=log-report${DOA}.txt
generate_summary(){
	echo "Date of Analaysis is : " $DOA
	echo "Log file name is :" $log_file
        
	total_lines=$(grep -c '^' "$log_file")	
	echo "total lines processed is :" $total_lines
	
	TRC=$(grep -c "ERROR" "$log_file" )
	echo "Total Error count is : " $TRC

	echo "....... List of Critical Events ......."
	grep -n "CRITICAL" "$log_file" | awk -F: '{printf "Line %-5s | %s\n", $1, $2}'

}

generate_summary > $report_file
