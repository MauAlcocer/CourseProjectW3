# CodeBook

a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

In order to obtain a tidy dataset with the characteristics enlisted on the Course Project description I followed the next steps:

1. Using the train dataset (X_train.txt, which variable description/names are clear from the features_info.txt) I merged it with the subject index contained in the subject_train.txt and the y_train.txt that has the indicator of "activiy" (ie. walking, walking upstairs, walking downstairs, sitting, standing and laying). The resulting dataset accounts for the 70% of total observations.

2. At this point the new dataset has no clear variable names. The next step consists on assigning the 561 names from the features.txt file to the variable names to the new dataset. In addition it is necessary to rename the subject variable and the activity variable.

3. We repeat the first two steps for the remaining 30% of the observations that are contained in the test.txt file. This file uses the same kind of table for the subject and activity information.

4. Once we have a transformed datasets from the train and test datasets we merge them using the rbind command (as they complete themselves in observations and not in variables).

5. Next we keep only the measurements on the mean and standard deviation for each measurement as stated in the instructions. We do this using the grep command to subset the variables from the complete new dataset. We kept only those variables that contained the words "mean()" and "std()"

6. It is also necessary to create two new "bunches" of variables. The first one calculated as the average for each original variable for every subjetc and a the second is the average for each subject in each original variable.




