---
title: "tidy.md"
author: "Nik"
date: "2025-04-07"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This code was written by Nik Bachmann as proejct assignment for the Getting and 
Cleaning Data course on Coursera. 

## Data
The project is using data downloaded from:
 
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

## Variables
# Main variables
- 'subjects' - ID of individual
- 'activities' - logged activity, such as standing, walking upstairs, or sitting

# Measurement variables
These are composed of multiple components, broken down as follows: 

- 'time' / 'frequency' - describes domain of this measurement (time domain before and frequency domain after Fourier transformation)
- accelerometer' - measurement from accelerometer
- 'gyroscope' - measurement from gyroscope
- 'mean' - average of measurements
- 'stdev' - standard deviation of measurements

## Transformations performed
1. Data from individual text files was read out and stored in variables
2. Train and test datasets were combined into new dataset that contains all entries for a measurement
3. Measurements describing mean values or standard deviations were selected
4. Subject ID, Activity label and all measurements were combined into one data table
5. Data table was grouped by subject ID and activity
6. Averages for each group were calculated
7. These averages were written into a new text file "tidy.txt"

## Other work
1. Activity labels were changed from an ID number to the actual name of the activity
2. Measurement labels were formatted to be more readable, with descriptive titles, all lowercase
        and removal of special characters

## Conclusion
This code creates a text file that contains the means and standard deviations of the full (test+train) dataset grouped by subject and activity, with labels that are readily understandable by humans.


