# Codebook 

## Introduction 
The test and training datasets from the "Human Activity Recognition Using Smartphones" (HARUS) data are merged. 
The resulting dataset is converted into a smaller, tidy dataset containing only standard deviantion and mean measures from the original set.

## Source of input data 
A description of the HARUS datasets can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input dataset for the code described in this document was downloaded from this URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For the script to run, the data is expected to be unzippped into a folder named "UCI HAR Dataset" in the current working directory.
In third line of the script "run_analysis.R" the working directory can be set to the destination of teh 


## Data Transformations
The script in "run_analysis.R" takes the HARUS test and training datasets test as input. 
It then does the following:
* line 9 imports the activity labels from "activity_labels.txt"
* lines 10 to 19 load the original column names from "features.txt", make them all lowercase, exchange abreviations with full words and exchange special charcters with underlines. The names are used for both the test and the training datasets.
* lines 21 to 25 import the HARUS test dataset from "X_test.txt". The the coded acticities are loaded from "y_test.txt", the coded saubject IDs from "subject_test.txt". 
* lines 27 to 31 import the HARUS train dataset. They does the same things for training, as lines 21 to 25 do for test.
* line 33 produces a new dataset by select combining test and training datasets. The datasets are stacked row-wise on top of each other.
* lines 34 to 35 produce a new dataset by selecting only the columns from the combined set which contain mean or standard deviantion measurements. 
* lines 37 to 38 produce a new dataset by selecting averaging the rows from the previous set that contain the same subject and the same activity. This means that the new dataset contains mean values for each combination of subject and activity. 
* line 40 writes the averaged dataset to file int he current working directory.

## Missing Data
When tested, the dataset resulting from the script should contain no missing values.
 
## Output Data 
The dataset is saved to a csv. Rownames are not written to file. Delimeters are ",".

subject: Integer, numerical ID of test subject performing the measured activities
activity: Type af activity the testsubject was measured while performing. Can be one if the following 6 factors:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

All other vairables are numerical with values bounded within [-1,1].
The dataset contains only those variables from the orginal "Human Activity Recognition Using Smartphones" (HARUS) dataset that include either a standard deviation or a mean being taken from some original measure. This is signified by "mean" or "std" (standard deviation) being part of the varibale name.
A trailing "x", "y" or "z" shows cartesian cordiante that was measured. 
For more details about the what the different variables measure (e.g. in which was acceleration is defined), see the original dataset description.
                                   
t_body_acceleration_mean_x                      
t_body_acceleration_mean_y                      
t_body_acceleration_mean_z                       
t_body_acceleration_std_x                       
t_body_acceleration_std_y                        
t_body_acceleration_std_z                       
t_gravity_acceleration_mean_x                    
t_gravity_acceleration_mean_y                   
t_gravity_acceleration_mean_z                    
t_gravity_acceleration_std_x                    
t_gravity_acceleration_std_y                     
t_gravity_acceleration_std_z                    
t_body_acceleration_jerk_mean_x                  
t_body_acceleration_jerk_mean_y                 
t_body_acceleration_jerk_mean_z                  
t_body_acceleration_jerk_std_x                  
t_body_acceleration_jerk_std_y                   
t_body_acceleration_jerk_std_z                  
t_body_gyro_mean_x                               
t_body_gyro_mean_y                              
t_body_gyro_mean_z                               
t_body_gyro_std_x                               
t_body_gyro_std_y                                
t_body_gyro_std_z                               
t_body_gyro_jerk_mean_x                          
t_body_gyro_jerk_mean_y                         
t_body_gyro_jerk_mean_z                          
t_body_gyro_jerk_std_x                          
t_body_gyro_jerk_std_y                           
t_body_gyro_jerk_std_z                          
f_body_acceleration_mean_x                       
f_body_acceleration_mean_y                      
f_body_acceleration_mean_z                       
f_body_acceleration_std_x                       
f_body_acceleration_std_y                        
f_body_acceleration_std_z                       
f_body_acceleration_jerk_mean_x                  
f_body_acceleration_jerk_mean_y                 
f_body_acceleration_jerk_mean_z                  
f_body_acceleration_jerk_std_x                  
f_body_acceleration_jerk_std_y                   
f_body_acceleration_jerk_std_z                  
f_body_gyro_mean_x                               
f_body_gyro_mean_y                              
f_body_gyro_mean_z                               
f_body_gyro_std_x                               
f_body_gyro_std_y                                
f_body_gyro_std_z

## Version information
The script was tested with the following session:

R version 3.3.2 (2016-10-31)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows >= 8 x64 (build 9200)

locale:
[1] LC_COLLATE=German_Germany.1252  LC_CTYPE=German_Germany.1252   
[3] LC_MONETARY=German_Germany.1252 LC_NUMERIC=C                   
[5] LC_TIME=German_Germany.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] dplyr_0.5.0