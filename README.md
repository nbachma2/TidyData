# Introduction

The content of this repository was written by Nik Bachmann as project assignment for the Getting and 
Cleaning Data course on Coursera. It is using data downloaded from:
 
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

and extracted into the working directory. 

A description of the data is available here: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

In short, the data contains movement sensors (accelerometer and gyroscope) worn by several 
subjects performing different activities. The data was split into a test 
set (30%) and a training set (70%). Data from each set was stored across several
different .txt files. This code will read out all the data, select those measurements
represent the means and standard deviations for each measurement. 
Variable and activity names are changed into more descriptive and readable names.
Finally, the average for each activity and each subject is calculated and 
written into a file called tidy.txt. 

# Files contained

- 'run_analysis.R': R script to perform the task described above, creating a tidy dataset in a new file called 'tidy.txt'
- 'CodeBook.md': Codebook describing the data and variables, as well as transformations and other work performed.
- 'README.md': Readme file describing the repository and code
- 'tidy.txt': Output file of run_analysis(), formatted and averaged data as described above

# How to run code: 
Make sure that that zip-archive downloaded from the link above is extracted into 
your current working directory, as that the 'run_analysis.R' is in the same working directory. 
```
source("run_analysis.R"")
run_analysis()
```