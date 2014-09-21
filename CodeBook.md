Codebook for proj_output.txt
============================

Source data description
-----------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].

Variables in processed data
---------------------------

In the processed data, "Acc" was replaced by "Accelerometer" and "Gyro" was replaced by "Gyroscope" to clarify the column names. The source data were filtered to get only the mean ("mean") and standard deviation ("std") for every variable and then aggregated on the level of subject (1-30) and activity (LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, WALKING UPSTAIRS). For each combination of the subject and activity average values of the variables were calculated.

The final variable naming convention is the following (expressions in parentheses give all possible combinations). Meaning of the measurement is described above.

* Subject
* Activity
* avg_(t/f)BodyAccelerometer-(mean/std)-(X/Y/Z)
* avg_tGravityAccelerometer-(mean/std)-(X/Y/Z)
* avg_(t/f)BodyAccelerometerJerk-(mean/std)-(X/Y/Z)
* avg_(t/f)BodyGyroscope-(mean/std)-(X/Y/Z)
* avg_tBodyGyroscopeJerk-(mean/std)-(X/Y/Z)
* avg_(t/f)BodyAccelerometerMag-(mean/std)
* avg_tGravityAccelerometerMag-(mean/std)
* avg_(t/f)BodyAccelerometerJerkMag-(mean/std)
* avg_(t/f)BodyGyroscopeMag-(mean/std)
* avg_(t/f)BodyGyroscopeJerkMag-(mean/std)

where 
* t/f ... time or frequency measurement
* mean/std ... mean or standard deviation of a data sample
* X/Y/Z ... given axis

The measurements are bounded by [-1, 1] and are dimensionless.