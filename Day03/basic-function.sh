#!/bin/bash
read -p "enter name : " name
greet() {
	echo "hello $1"	
}
greet "$name"

add() {
	read -p "enter num1 : " num1
	read -p "enter num2 : " num2
	
	echo "addition of number is $((num1+num2))"
}

add
