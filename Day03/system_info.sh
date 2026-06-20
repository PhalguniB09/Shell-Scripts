#!/bin/bash
set -euo pipefail

system_info(){
	echo "System Information"
	hostnamectl | head -10
}

uptime_info(){
	echo "----System Uptime Information----"
	uptime
}

disk_usage(){
	echo "----Disk Usage----"
	df -h
}

memory_usage(){
	echo "----Memory Usage----"
	free -h	
}

cpu_usage(){
	echo "----CPU Usage----"
	ps aux --sort=-%cpu |head -6	
}

main(){
	system_info
	uptime_info
	disk_usage
	memory_usage
	cpu_usage
}

main



