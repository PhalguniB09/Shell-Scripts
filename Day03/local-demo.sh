#!/bin/bash

local-function() {
	local name="Phalguni"
}

global-function() {
	city="Pune"
}

local-function
echo "name is $name"
global-function
echo "city is $city"
