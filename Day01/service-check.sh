#!/bin/bash
 read -p "enter service name : " SERVICE
 read -p "do you want to check the status ? " STATUS

 if [ "$STATUS" == "Y" ]; then
	 systemctl status $SERVICE
 else 
	 echo "SKIPPED"
 fi 
