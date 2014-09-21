coursera_03gcd
==============

Repository for Coursera course Getting and Cleaning Data

This repository includes source code and codebook for a course project for Coursera Getting and Cleaning Data course. The code is called "run_analysis.R" and does the following:

1. Downloads and unzips data for the project
2. Extracts the data into R, renames the columns and merges the raw data into a single data frame
3. Selects only "mean" and "std" columns from the original data
4. Renames some of the variables for better self-description
5. Aggregates the data according to subjects and activites and calculates means of all the measurements based on these variables
6. Writes the result into the file proj_output.txt

The codebook is called CodeBook.md and describes the variables and the structure of the output file.