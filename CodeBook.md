CodeBook for Getting and Cleaning Data Programming Assignment
========================================================

Code Book:
==========
Variable Information:

Subject Number:

     1 to 30 - the volunteer number
     
Activity (one of 6 possible values): 

     WALKING - collected while subject was walking
     SITTING - collected while subject was sitting
     STANDING - collected while subject was standing
     LAYING - collected while subject was laying
     WALKING_UPSTAIRS - collected while subject was walking up stairs
     WALKING_DOWNSTAIRS - collected while subject was walking down stairs

Sensor Data:
Mean and standard deviation data was gathered per sensor<Mean/StdDev>.  Some sensors also have multiple readings (one per 3 dimensional axis) <X/Y/Z>Axis

See legend below for explanation of all components.  All are unitless as they are normalized data.

     Time_BodyMotion_Accelerometer_<Mean/StdDev>_<X/Y/Z>Axis
     Time_Gravitational_Accelerometer_<Mean/StdDev>_<X/Y/Z>Axis
     Time_BodyMotion_Accelerometer_Jerk_<Mean/StdDev>_<X/Y/Z>Axis
     Time_BodyMotion_Gyroscope_<Mean/StdDev>_<X/Y/Z>Axis
     Time_BodyMotion_Gyroscope_Jerk_<Mean/StdDev>_<X/Y/Z>Axis
     Time_BodyMotion_Accelerometer_Magnitude_<Mean/StdDev>_
     Time_Gravitational_Accelerometer_Magnitude_<Mean/StdDev>_
     Time_BodyMotion_Accelerometer_JerkMagnitude_<Mean/StdDev>_
     Time_BodyMotion_Gyroscope_Magnitude_<Mean/StdDev>_
     Time_BodyMotion_Gyroscope_JerkMagnitude_<Mean/StdDev>_
     Frequency_BodyMotion_Accelerometer_<Mean/StdDev>_<X/Y/Z>Axis
     Frequency_BodyMotion_Accelerometer_Jerk_<Mean/StdDev>_<X/Y/Z>Axis
     Frequency_BodyMotion_Gyroscope_<Mean/StdDev>_<X/Y/Z>Axis
     Frequency_BodyMotion_Accelerometer_Magnitude_<Mean/StdDev>_
     Frequency_BodyMotion_Accelerometer_JerkMagnitude_<Mean/StdDev>_
     Frequency_BodyMotion_Gyroscope_Magnitude_<Mean/StdDev>_
     Frequency_BodyMotion_Gyroscope_JerkMagnitude_<Mean/StdDev>_

Legend:

     Time_ : data point is collected with respect to the time domain
     Frequency_ : data point is collected with respect to the frequency domain
     Mean_ : data point is a mean over the time window of collection
     StdDev_ : data point is a standard deviation over the time window of collection
     BodyMotion_ : data point corresponds to body motion component of acceleartion signal from sensor
     Gravitational_: data point corresponds to gravitational componenent of acceleartion signal from sensor
     Accelerometer_ : data point collected using accelerometer
     Gyroscope_: data point collected using gyroscopic sensor
     Jerk_ : data point is Jerk (rate of change of acceleration)
     Magnitude_ : data point is magnitude
     JerkMagnitude: data point is magnitude of jerk 

Data Summary Process:
=====================
The final data calculated in the tidy data set is the average of each variable for each activity and each subject.  Each variable in this case was either a *mean() or *std() variable.  Each observation of a variable for each activity and each subject was combined into a mean value.  For instance, all observations of Time_BodyMotion_Accelerometer_Mean_Xaxis for subject 1 while he/she was SITTING was averaged into one data value. 

Study Design:
============
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

