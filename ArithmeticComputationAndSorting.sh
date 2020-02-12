#!/bin/bash -x

echo "/*********************************** ARITHMETIC COMPUTATION AND SORTING ***********************************/"

# READING THREE NUMBER INPUT 
read -p "Enter the first number :" a
read -p "Enter the Second number :" b
read -p "Enter the third number :" c

# ARITHMETIC COMPUTATIONS
firstOperation=$((a+b*c))
secondOperation=$((a*b+c))
