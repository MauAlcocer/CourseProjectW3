# CodeBook

In order to obtain a tidy dataset with the characteristics enlisted on the Course Project description I followed the next steps:

1. Using the train dataset (X_train.txt, which variable description/names are clear from the features_info.txt) I merged it with the subject index contained in the subject_train.txt and the y_train.txt that has the indicator of "activiy" (ie. walking, walking upstairs, walking downstairs, sitting, standing and laying). The resulting dataset accounts for the 70% of total observations.

2. At this point the new dataset has no clear variable names. The next step consists on assigning the 561 names from the features.txt file to the variable names to the new dataset. In addition it is necessary to rename the subject variable and the activity variable.

3. We repeat the first two steps for the remaining 30% of the observations that are contained in the test.txt file. This file uses the same kind of table for the subject and activity information.

4. Once we have a transformed datasets from the train and test datasets we merge them using the rbind command (as they complete themselves in observations and not in variables).

5. Next we keep only the measurements on the mean and standard deviation for each measurement as stated in the instructions. We do this using the grep command to subset the variables from the complete new dataset. We kept only those variables that contained the words "mean()" and "std()". This operations leave us with a dataset with 79 measurements.

6. It is also necessary to create two new "bunches" of variables. The first one calculated as the average for each original variable for every subject (adding one variable per each original measurement, 79 extra variables) and a the second is the average for each subject in each original variable (another 79 additional variables). So the final tidy dataset is composed by 79 original measurements, plus 79 average measurement for each subject, plus 79 average measurements for each activity and 3 index variables (subject, activity_code [activities coded as in the original dataset with numbers] and activity.factor [correctly labeled activities]).

The final dataset variables are:

  [1] "subject"                             subject id (from 1 to 30). Original source subject_test.txt and         subject_train.txt files
  [2] "activity.factor"                        activity indicadtor as factor variable. Original source y_test.txt and y_train.txt files
  
The following 79 variables of are the original measurments recorded on the train.txt and test.txt datasets. The set of variables that we kept in the final dataset are the mean and standard deviation estimates from the signals.  The description, definitiona and units for this variables can be found in the features_info.txt file and the README.txt file from the original dataset folder. We reproduce the instructions from the features_info.txt file.

====================================================================================================================
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

====================================================================================================================

  [3] "tBodyAcc-mean()-X"                      
  [4] "tBodyAcc-mean()-Y"                      
  [5] "tBodyAcc-mean()-Z"                      
  [6] "tGravityAcc-mean()-X"                   
  [7] "tGravityAcc-mean()-Y"                   
  [8] "tGravityAcc-mean()-Z"                   
  [9] "tBodyAccJerk-mean()-X"                  
 [10] "tBodyAccJerk-mean()-Y"                  
 [11] "tBodyAccJerk-mean()-Z"                  
 [12] "tBodyGyro-mean()-X"                     
 [13] "tBodyGyro-mean()-Y"                     
 [14] "tBodyGyro-mean()-Z"                     
 [15] "tBodyGyroJerk-mean()-X"                 
 [16] "tBodyGyroJerk-mean()-Y"                 
 [17] "tBodyGyroJerk-mean()-Z"                 
 [18] "tBodyAccMag-mean()"                     
 [19] "tGravityAccMag-mean()"                  
 [20] "tBodyAccJerkMag-mean()"                 
 [21] "tBodyGyroMag-mean()"                    
 [22] "tBodyGyroJerkMag-mean()"                
 [23] "fBodyAcc-mean()-X"                      
 [24] "fBodyAcc-mean()-Y"                      
 [25] "fBodyAcc-mean()-Z"                      
 [26] "fBodyAcc-meanFreq()-X"                  
 [27] "fBodyAcc-meanFreq()-Y"                  
 [28] "fBodyAcc-meanFreq()-Z"                  
 [29] "fBodyAccJerk-mean()-X"                  
 [30] "fBodyAccJerk-mean()-Y"                  
 [31] "fBodyAccJerk-mean()-Z"                  
 [32] "fBodyAccJerk-meanFreq()-X"              
 [33] "fBodyAccJerk-meanFreq()-Y"              
 [34] "fBodyAccJerk-meanFreq()-Z"              
 [35] "fBodyGyro-mean()-X"                     
 [36] "fBodyGyro-mean()-Y"                     
 [37] "fBodyGyro-mean()-Z"                     
 [38] "fBodyGyro-meanFreq()-X"                 
 [39] "fBodyGyro-meanFreq()-Y"                 
 [40] "fBodyGyro-meanFreq()-Z"                 
 [41] "fBodyAccMag-mean()"                     
 [42] "fBodyAccMag-meanFreq()"                 
 [43] "fBodyBodyAccJerkMag-mean()"             
 [44] "fBodyBodyAccJerkMag-meanFreq()"         
 [45] "fBodyBodyGyroMag-mean()"                
 [46] "fBodyBodyGyroMag-meanFreq()"            
 [47] "fBodyBodyGyroJerkMag-mean()"            
 [48] "fBodyBodyGyroJerkMag-meanFreq()"        
 [49] "tBodyAcc-std()-X"                       
 [50] "tBodyAcc-std()-Y"                       
 [51] "tBodyAcc-std()-Z"                       
 [52] "tGravityAcc-std()-X"                    
 [53] "tGravityAcc-std()-Y"                    
 [54] "tGravityAcc-std()-Z"                    
 [55] "tBodyAccJerk-std()-X"                   
 [56] "tBodyAccJerk-std()-Y"                   
 [57] "tBodyAccJerk-std()-Z"                   
 [58] "tBodyGyro-std()-X"                      
 [59] "tBodyGyro-std()-Y"                      
 [60] "tBodyGyro-std()-Z"                      
 [61] "tBodyGyroJerk-std()-X"                  
 [62] "tBodyGyroJerk-std()-Y"                  
 [63] "tBodyGyroJerk-std()-Z"                  
 [64] "tBodyAccMag-std()"                      
 [65] "tGravityAccMag-std()"                   
 [66] "tBodyAccJerkMag-std()"                  
 [67] "tBodyGyroMag-std()"                     
 [68] "tBodyGyroJerkMag-std()"                 
 [69] "fBodyAcc-std()-X"                       
 [70] "fBodyAcc-std()-Y"                       
 [71] "fBodyAcc-std()-Z"                       
 [72] "fBodyAccJerk-std()-X"                   
 [73] "fBodyAccJerk-std()-Y"                   
 [74] "fBodyAccJerk-std()-Z"                   
 [75] "fBodyGyro-std()-X"                      
 [76] "fBodyGyro-std()-Y"                      
 [77] "fBodyGyro-std()-Z"                      
 [78] "fBodyAccMag-std()"                      
 [79] "fBodyBodyAccJerkMag-std()"              
 [80] "fBodyBodyGyroMag-std()"                 
 [81] "fBodyBodyGyroJerkMag-std()"   
 
 
 [82] "activity.code"                          This is the activity code, not factor. Original source Original source y_test.txt and y_train.txt files
 
The following 79 variables are calculations of the average measurement by activity (all these variables are named as "actavg_[measurument]" to denote they are the activity average for certain measurement from the original data set.) 
 
 [83] "actavg_tBodyAcc-mean()-X"               
 [84] "actavg_tBodyAcc-mean()-Y"               
 [85] "actavg_tBodyAcc-mean()-Z"               
 [86] "actavg_tGravityAcc-mean()-X"            
 [87] "actavg_tGravityAcc-mean()-Y"            
 [88] "actavg_tGravityAcc-mean()-Z"            
 [89] "actavg_tBodyAccJerk-mean()-X"           
 [90] "actavg_tBodyAccJerk-mean()-Y"           
 [91] "actavg_tBodyAccJerk-mean()-Z"           
 [92] "actavg_tBodyGyro-mean()-X"              
 [93] "actavg_tBodyGyro-mean()-Y"              
 [94] "actavg_tBodyGyro-mean()-Z"              
 [95] "actavg_tBodyGyroJerk-mean()-X"          
 [96] "actavg_tBodyGyroJerk-mean()-Y"          
 [97] "actavg_tBodyGyroJerk-mean()-Z"          
 [98] "actavg_tBodyAccMag-mean()"              
 [99] "actavg_tGravityAccMag-mean()"           
[100] "actavg_tBodyAccJerkMag-mean()"          
[101] "actavg_tBodyGyroMag-mean()"             
[102] "actavg_tBodyGyroJerkMag-mean()"         
[103] "actavg_fBodyAcc-mean()-X"               
[104] "actavg_fBodyAcc-mean()-Y"               
[105] "actavg_fBodyAcc-mean()-Z"               
[106] "actavg_fBodyAcc-meanFreq()-X"           
[107] "actavg_fBodyAcc-meanFreq()-Y"           
[108] "actavg_fBodyAcc-meanFreq()-Z"           
[109] "actavg_fBodyAccJerk-mean()-X"           
[110] "actavg_fBodyAccJerk-mean()-Y"           
[111] "actavg_fBodyAccJerk-mean()-Z"           
[112] "actavg_fBodyAccJerk-meanFreq()-X"       
[113] "actavg_fBodyAccJerk-meanFreq()-Y"       
[114] "actavg_fBodyAccJerk-meanFreq()-Z"       
[115] "actavg_fBodyGyro-mean()-X"              
[116] "actavg_fBodyGyro-mean()-Y"              
[117] "actavg_fBodyGyro-mean()-Z"              
[118] "actavg_fBodyGyro-meanFreq()-X"          
[119] "actavg_fBodyGyro-meanFreq()-Y"          
[120] "actavg_fBodyGyro-meanFreq()-Z"          
[121] "actavg_fBodyAccMag-mean()"              
[122] "actavg_fBodyAccMag-meanFreq()"          
[123] "actavg_fBodyBodyAccJerkMag-mean()"      
[124] "actavg_fBodyBodyAccJerkMag-meanFreq()"  
[125] "actavg_fBodyBodyGyroMag-mean()"         
[126] "actavg_fBodyBodyGyroMag-meanFreq()"     
[127] "actavg_fBodyBodyGyroJerkMag-mean()"     
[128] "actavg_fBodyBodyGyroJerkMag-meanFreq()" 
[129] "actavg_tBodyAcc-std()-X"                
[130] "actavg_tBodyAcc-std()-Y"                
[131] "actavg_tBodyAcc-std()-Z"                
[132] "actavg_tGravityAcc-std()-X"             
[133] "actavg_tGravityAcc-std()-Y"             
[134] "actavg_tGravityAcc-std()-Z"             
[135] "actavg_tBodyAccJerk-std()-X"            
[136] "actavg_tBodyAccJerk-std()-Y"            
[137] "actavg_tBodyAccJerk-std()-Z"            
[138] "actavg_tBodyGyro-std()-X"               
[139] "actavg_tBodyGyro-std()-Y"               
[140] "actavg_tBodyGyro-std()-Z"               
[141] "actavg_tBodyGyroJerk-std()-X"           
[142] "actavg_tBodyGyroJerk-std()-Y"           
[143] "actavg_tBodyGyroJerk-std()-Z"           
[144] "actavg_tBodyAccMag-std()"               
[145] "actavg_tGravityAccMag-std()"            
[146] "actavg_tBodyAccJerkMag-std()"           
[147] "actavg_tBodyGyroMag-std()"              
[148] "actavg_tBodyGyroJerkMag-std()"          
[149] "actavg_fBodyAcc-std()-X"                
[150] "actavg_fBodyAcc-std()-Y"                
[151] "actavg_fBodyAcc-std()-Z"                
[152] "actavg_fBodyAccJerk-std()-X"            
[153] "actavg_fBodyAccJerk-std()-Y"            
[154] "actavg_fBodyAccJerk-std()-Z"            
[155] "actavg_fBodyGyro-std()-X"               
[156] "actavg_fBodyGyro-std()-Y"               
[157] "actavg_fBodyGyro-std()-Z"               
[158] "actavg_fBodyAccMag-std()"               
[159] "actavg_fBodyBodyAccJerkMag-std()"       
[160] "actavg_fBodyBodyGyroMag-std()"          
[161] "actavg_fBodyBodyGyroJerkMag-std()"   

The following 79 variables are calculations of the average measurement by subject (all these variables are named as "subjavg_[measurument]" to denote they are the subject average for certain measurement from the original data set.) 

[162] "subjavg_tBodyAcc-mean()-X"              
[163] "subjavg_tBodyAcc-mean()-Y"              
[164] "subjavg_tBodyAcc-mean()-Z"              
[165] "subjavg_tGravityAcc-mean()-X"           
[166] "subjavg_tGravityAcc-mean()-Y"           
[167] "subjavg_tGravityAcc-mean()-Z"           
[168] "subjavg_tBodyAccJerk-mean()-X"          
[169] "subjavg_tBodyAccJerk-mean()-Y"          
[170] "subjavg_tBodyAccJerk-mean()-Z"          
[171] "subjavg_tBodyGyro-mean()-X"             
[172] "subjavg_tBodyGyro-mean()-Y"             
[173] "subjavg_tBodyGyro-mean()-Z"             
[174] "subjavg_tBodyGyroJerk-mean()-X"         
[175] "subjavg_tBodyGyroJerk-mean()-Y"         
[176] "subjavg_tBodyGyroJerk-mean()-Z"         
[177] "subjavg_tBodyAccMag-mean()"             
[178] "subjavg_tGravityAccMag-mean()"          
[179] "subjavg_tBodyAccJerkMag-mean()"         
[180] "subjavg_tBodyGyroMag-mean()"            
[181] "subjavg_tBodyGyroJerkMag-mean()"        
[182] "subjavg_fBodyAcc-mean()-X"              
[183] "subjavg_fBodyAcc-mean()-Y"              
[184] "subjavg_fBodyAcc-mean()-Z"              
[185] "subjavg_fBodyAcc-meanFreq()-X"          
[186] "subjavg_fBodyAcc-meanFreq()-Y"          
[187] "subjavg_fBodyAcc-meanFreq()-Z"          
[188] "subjavg_fBodyAccJerk-mean()-X"          
[189] "subjavg_fBodyAccJerk-mean()-Y"          
[190] "subjavg_fBodyAccJerk-mean()-Z"          
[191] "subjavg_fBodyAccJerk-meanFreq()-X"      
[192] "subjavg_fBodyAccJerk-meanFreq()-Y"      
[193] "subjavg_fBodyAccJerk-meanFreq()-Z"      
[194] "subjavg_fBodyGyro-mean()-X"             
[195] "subjavg_fBodyGyro-mean()-Y"             
[196] "subjavg_fBodyGyro-mean()-Z"             
[197] "subjavg_fBodyGyro-meanFreq()-X"         
[198] "subjavg_fBodyGyro-meanFreq()-Y"         
[199] "subjavg_fBodyGyro-meanFreq()-Z"         
[200] "subjavg_fBodyAccMag-mean()"             
[201] "subjavg_fBodyAccMag-meanFreq()"         
[202] "subjavg_fBodyBodyAccJerkMag-mean()"     
[203] "subjavg_fBodyBodyAccJerkMag-meanFreq()" 
[204] "subjavg_fBodyBodyGyroMag-mean()"        
[205] "subjavg_fBodyBodyGyroMag-meanFreq()"    
[206] "subjavg_fBodyBodyGyroJerkMag-mean()"    
[207] "subjavg_fBodyBodyGyroJerkMag-meanFreq()"
[208] "subjavg_tBodyAcc-std()-X"               
[209] "subjavg_tBodyAcc-std()-Y"               
[210] "subjavg_tBodyAcc-std()-Z"               
[211] "subjavg_tGravityAcc-std()-X"            
[212] "subjavg_tGravityAcc-std()-Y"            
[213] "subjavg_tGravityAcc-std()-Z"            
[214] "subjavg_tBodyAccJerk-std()-X"           
[215] "subjavg_tBodyAccJerk-std()-Y"           
[216] "subjavg_tBodyAccJerk-std()-Z"           
[217] "subjavg_tBodyGyro-std()-X"              
[218] "subjavg_tBodyGyro-std()-Y"              
[219] "subjavg_tBodyGyro-std()-Z"              
[220] "subjavg_tBodyGyroJerk-std()-X"          
[221] "subjavg_tBodyGyroJerk-std()-Y"          
[222] "subjavg_tBodyGyroJerk-std()-Z"          
[223] "subjavg_tBodyAccMag-std()"              
[224] "subjavg_tGravityAccMag-std()"           
[225] "subjavg_tBodyAccJerkMag-std()"          
[226] "subjavg_tBodyGyroMag-std()"             
[227] "subjavg_tBodyGyroJerkMag-std()"         
[228] "subjavg_fBodyAcc-std()-X"               
[229] "subjavg_fBodyAcc-std()-Y"               
[230] "subjavg_fBodyAcc-std()-Z"               
[231] "subjavg_fBodyAccJerk-std()-X"           
[232] "subjavg_fBodyAccJerk-std()-Y"           
[233] "subjavg_fBodyAccJerk-std()-Z"           
[234] "subjavg_fBodyGyro-std()-X"              
[235] "subjavg_fBodyGyro-std()-Y"              
[236] "subjavg_fBodyGyro-std()-Z"              
[237] "subjavg_fBodyAccMag-std()"              
[238] "subjavg_fBodyBodyAccJerkMag-std()"      
[239] "subjavg_fBodyBodyGyroMag-std()"         
[240] "subjavg_fBodyBodyGyroJerkMag-std()" 





