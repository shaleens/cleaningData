# Code Book for the tidy datasets 1 and 2

## Source data set

The tidy data is created from the source data set titled *Human Activity Recognition Using Smartphones Data Set*, the details of which are found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The corresponding data can be downloaded at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Quoting the description of the dataset, the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

## Tidy dataset 1



The first tidy data set contains only the standard deviation and mean (mean frequencies are not included) for each measurement. 
It contains a total of 10299 observations of 75 variables.
Following are the column names for each of them:

### Variable description, format and nomenclature
*activity
**This is the label for the dataset, and stores the descriptive factor of the tasks carried out by the subjects
**Following are the different activities, recorded in the dataset in the form of a string, captured by a person:
***WALKING
***WALKING_UPSTAIRS
***WALKING_DOWNSTAIRS
***SITTING
***STANDING
***LAYING 
* subject
** This is indexed from 1-30, each uniquely identifying the thirty different people used as test subjects for the experiment
* The variable names for measurements follow the following formats:
**[measurement_name]-[mean/std]
**[measurement_name]-[mean/std]-[axis]
*axis can take the values X, Y and Z.
*mean signifies average
*std signifies standard deviation

* list of possible measurements:
**tBodyAcc-XYZ
**tGravityAcc-XYZ
**tBodyAccJerk-XYZ
**tBodyGyro-XYZ
**tBodyGyroJerk-XYZ
**tBodyAccMag
**tGravityAccMag
**tBodyAccJerkMag
**tBodyGyroMag
**tBodyGyroJerkMag
**fBodyAcc-XYZ
**fBodyAccJerk-XYZ
**fBodyGyro-XYZ
**fBodyAccMag
**fBodyAccJerkMag
**fBodyGyroMag
**fBodyGyroJerkMag
*Please note that XYZ represents separate measurements on three different axis



### Complete list of variables:
1	tBodyAcc-mean-X
2	tBodyAcc-mean-Y
3	tBodyAcc-mean-Z
4	tBodyAcc-std-X
5	tBodyAcc-std-Y
6	tBodyAcc-std-Z
7	tGravityAcc-mean-X
8	tGravityAcc-mean-Y
9	tGravityAcc-mean-Z
10	tGravityAcc-std-X
11	tGravityAcc-std-Y
12	tGravityAcc-std-Z
13	tBodyAccJerk-mean-X
14	tBodyAccJerk-mean-Y
15	tBodyAccJerk-mean-Z
16	tBodyAccJerk-std-X
17	tBodyAccJerk-std-Y
18	tBodyAccJerk-std-Z
19	tBodyGyro-mean-X
20	tBodyGyro-mean-Y
21	tBodyGyro-mean-Z
22	tBodyGyro-std-X
23	tBodyGyro-std-Y
24	tBodyGyro-std-Z
25	tBodyGyroJerk-mean-X
26	tBodyGyroJerk-mean-Y
27	tBodyGyroJerk-mean-Z
28	tBodyGyroJerk-std-X
29	tBodyGyroJerk-std-Y
30	tBodyGyroJerk-std-Z
31	tBodyAccMag-mean
32	tBodyAccMag-std
33	tGravityAccMag-mean
34	tGravityAccMag-std
35	tBodyAccJerkMag-mean
36	tBodyAccJerkMag-std
37	tBodyGyroMag-mean
38	tBodyGyroMag-std
39	tBodyGyroJerkMag-mean
40	tBodyGyroJerkMag-std
41	fBodyAcc-mean-X
42	fBodyAcc-mean-Y
43	fBodyAcc-mean-Z
44	fBodyAcc-std-X
45	fBodyAcc-std-Y
46	fBodyAcc-std-Z
47	fBodyAccJerk-mean-X
48	fBodyAccJerk-mean-Y
49	fBodyAccJerk-mean-Z
50	fBodyAccJerk-std-X
51	fBodyAccJerk-std-Y
52	fBodyAccJerk-std-Z
53	fBodyGyro-mean-X
54	fBodyGyro-mean-Y
55	fBodyGyro-mean-Z
56	fBodyGyro-std-X
57	fBodyGyro-std-Y
58	fBodyGyro-std-Z
59	fBodyAccMag-mean
60	fBodyAccMag-std
61	fBodyBodyAccJerkMag-mean
62	fBodyBodyAccJerkMag-std
63	fBodyBodyGyroMag-mean
64	fBodyBodyGyroMag-std
65	fBodyBodyGyroJerkMag-mean
66	fBodyBodyGyroJerkMag-std
67	angletBodyAccMean,gravity
68	angletBodyAccJerkMean,gravityMean
69	angletBodyGyroMean,gravityMean
70	angletBodyGyroJerkMean,gravityMean
71	angleX,gravityMean
72	angleY,gravityMean
73	angleZ,gravityMean
74	activity
75	subject


##Tidy dataset 2
This contains the average of each of the measurement variables described in tidy dataset 1, for every combination of subject and activity. It contains a total of 180 observations of 76 variables. Effectively, there are 180 combinations of subject and activity.

###Variables
All the columns numbered 1 through 75 are there in this dataset. In addition, there is a variable called uniqueID, which is basically a string of the form
'''
[activity],[subject]
'''

All the row names are also having the values corresponding to the uniqueID
