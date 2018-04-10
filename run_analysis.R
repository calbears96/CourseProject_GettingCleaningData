#Getting and cleaning data course project R script

#load the test data sets
X_test = read.table('./data/UCI HAR Dataset/test/X_test.txt')
y_test = read.table('./data/UCI HAR Dataset/test/y_test.txt')
subject_test = read.table('./data/UCI HAR Dataset/test/subject_test.txt')


#load the train data sets
X_train = read.table('./data/UCI HAR Dataset/train/X_train.txt')
y_train = read.table('./data/UCI HAR Dataset/train/y_train.txt')
subject_train = read.table('./data/UCI HAR Dataset/train/subject_train.txt')

#load features.txt
features = read.table('./data/UCI HAR Dataset/features.txt')

#add column names to X_test using features column 2
names(X_test) = features[,2]

#add column names to X_train using features column 2
names(X_train) = features[,2]

#bind the subject data sets
subject_all = rbind(subject_test, subject_train)

#put together the X_test and X_train datasets
X_alldata = rbind(X_train, X_test)

#find the columns in X_alldata that contain either mean or std
mean_cols = grep('mean', names(X_alldata))
std_cols = grep('std', names(X_alldata))

#grab all columns in X_alldata that are either mean or std
X_alldata = X_alldata[c(mean_cols, std_cols)]

#bind the X_alldata and subject_all data
X_alldata = cbind(subject_all, X_alldata)
colnames(X_alldata)[colnames(X_alldata)=='V1'] = 'Subject'

#read in activity_labels that describes what activities are associated with what numbers
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#replace values in y_test/y_train with appropriate descriptive activity
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '1', 'WALKING')
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '2', 'WALKNG_UPSTAIRS')
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '3', 'WALKNG_DOWNSTAIRS')
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '4', 'SITTING')
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '5', 'STANDING')
y_test$V1 = replace(as.character(y_test$V1), y_test$V1 == '6', 'LAYING')

y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '1', 'WALKING')
y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '2', 'WALKNG_UPSTAIRS')
y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '3', 'WALKNG_DOWNSTAIRS')
y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '4', 'SITTING')
y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '5', 'STANDING')
y_train$V1 = replace(as.character(y_train$V1), y_train$V1 == '6', 'LAYING')

#combine the y_train/y_test data into y_alldata
y_alldata = rbind(y_train, y_test)
names(y_alldata) = 'Activity'

#bind the y_alldata and X_alldata data for a 'final merged data set'
Alldata = cbind(y_alldata, X_alldata)

#now, rename the variables so that they are descriptive
names(Alldata) =gsub('tBodyAcc-mean()', 'Mean_Body_Acceleration_Time', colnames(Alldata))
names(Alldata) = gsub('tGravityAcc-mean()', 'Mean_Gravity_Acceleration_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyAccJerk-mean()', 'Mean_Body_Acceleration_Jerk_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyGyro-mean()', 'Mean_Body_Gyro_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroJerk-mean()', 'Mean_Body_Gyro_Jerk_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyAccMag-mean()', 'Mean_Body_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGravityAccMag-mean()', 'Mean_Body_Gravity_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyAccJerkMag-mean()', 'Mean_Body_Acc_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroMag-mean()', 'Mean_Body_Gyro_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroJerkMag-mean()', 'Mean_Body_Gyro_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyAcc-mean()', 'Mean_FFT_Body_Acc', colnames(Alldata))
names(Alldata) = gsub('fBodyAccJerk-mean()', 'Mean_FFT_Body_Acc_jerk', colnames(Alldata))
names(Alldata) = gsub('fBodyGyro-mean()', 'Mean_FFT_Body_Gyro', colnames(Alldata))
names(Alldata) = gsub('fBodyAccMag-mean()', 'Mean_FFT_Body_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyAccJerkMag-mean()', 'Mean_FFT_Body_Acc_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tGravityAccMag-mean()', 'Mean_Gravity_Acc_Magnitude_Time', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyGyroMag-mean()', 'Mean_FFT_Body_Gyro_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyGyroJerkMag-mean()', 'Mean_FFT_Body_Gyro_Jerk_Magnitude', colnames(Alldata))

#now, rename the variables so that they are descriptive
names(Alldata) =gsub('tBodyAcc-std()', 'SD_Body_Acceleration_Time', colnames(Alldata))
names(Alldata) = gsub('tGravityAcc-std()', 'SD_Gravity_Acceleration_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyAccJerk-std()', 'SD_Body_Acceleration_Jerk_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyGyro-std()', 'SD_Body_Gyro_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroJerk-std()', 'SD_Body_Gyro_Jerk_Time', colnames(Alldata))
names(Alldata) = gsub('tBodyAccMag-std()', 'SD_Body_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGravityAccMag-std()', 'SD_Body_Gravity_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyAccJerkMag-std()', 'SD_Body_Acc_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroMag-std()', 'SD_Body_Gyro_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tBodyGyroJerkMag-std()', 'SD_Body_Gyro_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyAcc-std()', 'SD_FFT_Body_Acc', colnames(Alldata))
names(Alldata) = gsub('fBodyAccJerk-std()', 'SD_FFT_Body_Acc_jerk', colnames(Alldata))
names(Alldata) = gsub('fBodyGyro-std()', 'SD_FFT_Body_Gyro', colnames(Alldata))
names(Alldata) = gsub('fBodyAccMag-std()', 'SD_FFT_Body_Acc_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyAccJerkMag-std()', 'SD_FFT_Body_Acc_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('tGravityAccMag-std()', 'SD_Gravity_Acc_Magnitude_Time', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyGyroMag-std()', 'SD_FFT_Body_Gyro_Magnitude', colnames(Alldata))
names(Alldata) = gsub('fBodyBodyGyroJerkMag-std()', 'SD_FFT_Body_Gyro_Jerk_Magnitude', colnames(Alldata))
names(Alldata) = gsub('\\()', "", colnames(Alldata))
names(Alldata) = gsub('-', '', colnames(Alldata))
names(Alldata)

#make the data tidy: each row is an observation, each column is one variable. Observations (values) are
#the average for each variable for each acitivity and each subject
Alldata_tidy = Alldata %>% group_by(Subject, Activity) %>% 
  summarize(MeanBodyAccTime_Xaxis = mean(Mean_Body_Acceleration_TimeX),
            MeanBodyAccTime_Yaxis = mean(Mean_Body_Acceleration_TimeY),
            MeanBodyAccTime_Zaxis = mean(Mean_Body_Acceleration_TimeZ),
            MeanGravityAccTime_Xaxis = mean(Mean_Gravity_Acceleration_TimeX),
            MeanGravityAccTime_Yaxis = mean(Mean_Gravity_Acceleration_TimeY), 
            MeanGravityAccTime_Zaxis = mean(Mean_Gravity_Acceleration_TimeZ),
            MeanBodyAccJerkTime_Xaxis = mean(Mean_Body_Acceleration_Jerk_TimeX),
            MeanBodyAccJerkTime_Yaxis = mean(Mean_Body_Acceleration_Jerk_TimeY),
            MeanBodyAccJerkTime_Zaxis = mean(Mean_Body_Acceleration_Jerk_TimeZ),
            MeanBodyGyroTime_Xaxis = mean(Mean_Body_Gyro_TimeX),
            MeanBodyGyroTime_Yaxis = mean(Mean_Body_Gyro_TimeY),
            MeanBodyGyroTime_Zaxis = mean(Mean_Body_Gyro_TimeZ),
            MeanBodyGyroJerkTime_Xaxis = mean(Mean_Body_Gyro_Jerk_TimeX),
            MeanBodyGyroJerkTime_Yaxis = mean(Mean_Body_Gyro_Jerk_TimeY),
            MeanBodyGyroJerkTime_Zaxis = mean(Mean_Body_Gyro_Jerk_TimeZ),
            MeanBodyAccMagnitude_Time = mean(Mean_Body_Acc_Magnitude),
            MeanGravityAccMagnitude_Time = mean(Mean_Gravity_Acc_Magnitude_Time),
            MeanBodyAccJerkMagnitude_Time = mean(Mean_Body_Acc_Jerk_Magnitude),
            MeanBodyGyroMagnitude_Time = mean(Mean_Body_Gyro_Magnitude),
            MeanBodyGyroJerkMagnitude_Time = mean(Mean_Body_Gyro_Jerk_Magnitude),
            MeanFFTBodyAcc_Xaxis = mean(Mean_FFT_Body_AccX),
            MeanFFTBodyAcc_Yaxis = mean(Mean_FFT_Body_AccY),
            MeanFFTBodyAcc_Zaxis = mean(Mean_FFT_Body_AccZ),
            MeanFFTBodyAccFreq_Xaxis = mean(Mean_FFT_Body_AccFreqX),
            MeanFFTBodyAccFreq_Yaxis = mean(Mean_FFT_Body_AccFreqY),
            MeanFFTBodyAccFreq_Zaxis = mean(Mean_FFT_Body_AccFreqZ),
            MeanFFTBodyAccJerk_Xaxis = mean(Mean_FFT_Body_Acc_jerkX),
            MeanFFTBodyAccJerk_Yaxis = mean(Mean_FFT_Body_Acc_jerkY),
            MeanFFTBodyAccJerk_Zaxis = mean(Mean_FFT_Body_Acc_jerkZ),
            MeanFFTBodyAccJerkFreq_Xaxis = mean(Mean_FFT_Body_Acc_jerkFreqX),
            MeanFFTBodyAccJerkFreq_Yaxis = mean(Mean_FFT_Body_Acc_jerkFreqY),
            MeanFFTBodyAccJerkFreq_Zaxis = mean(Mean_FFT_Body_Acc_jerkFreqZ),
            MeanFFTBodyGyro_Xaxis = mean(Mean_FFT_Body_GyroX),
            MeanFFTBodyGyro_Yaxis = mean(Mean_FFT_Body_GyroY),
            MeanFFTBodyGyro_Zaxis = mean(Mean_FFT_Body_GyroZ),
            MeanFFTBodyGyroFreq_Xaxis = mean(Mean_FFT_Body_GyroFreqX),
            MeanFFTBodyGyroFreq_Yaxis = mean(Mean_FFT_Body_GyroFreqY),
            MeanFFTBodyGyroFreq_Zaxis = mean(Mean_FFT_Body_GyroFreqZ),
            MeanFFTBodyAccMagnitude = mean(Mean_FFT_Body_Acc_Magnitude),
            MeanFFTBodyAccMagFreq = mean(Mean_FFT_Body_Acc_MagnitudeFreq),
            MeanFFTBodyAccJerkMagnitude = mean(Mean_FFT_Body_Acc_Jerk_Magnitude),
            MeanFFTBodyAccJerkMagFreq = mean(Mean_FFT_Body_Acc_Jerk_MagnitudeFreq),
            MeanFFTBodyGyroMagnitude = mean(Mean_FFT_Body_Gyro_Magnitude),
            MeanFFTBodyGyroJerkMagnitude = mean(Mean_FFT_Body_Gyro_Jerk_Magnitude),
            MeanFFTBodyGyroMagFreq = mean(Mean_FFT_Body_Gyro_MagnitudeFreq),
            MeanFFTBodyGyroJerkMagnitude = mean(Mean_FFT_Body_Gyro_Jerk_Magnitude),
            MeanFFTBodyGyroJerkMagFreq = mean(Mean_FFT_Body_Gyro_Jerk_MagnitudeFreq),
            SDBodyAccTime_Xaxis = sd(SD_Body_Acceleration_TimeX),
            SDBodyAccTime_Yaxis = sd(SD_Body_Acceleration_TimeY),
            SDBodyAccTime_Zaxis = sd(SD_Body_Acceleration_TimeZ),
            SDGravityAccTime_Xaxis = sd(SD_Gravity_Acceleration_TimeX),
            SDGravityAccTime_Yaxis = sd(SD_Gravity_Acceleration_TimeY), 
            SDGravityAccTime_Zaxis = sd(SD_Gravity_Acceleration_TimeZ),
            SDBodyAccJerkTime_Xaxis = sd(SD_Body_Acceleration_Jerk_TimeX),
            SDBodyAccJerkTime_Yaxis = sd(SD_Body_Acceleration_Jerk_TimeY),
            SDBodyAccJerkTime_Zaxis = sd(SD_Body_Acceleration_Jerk_TimeZ),
            SDBodyGyroTime_Xaxis = sd(SD_Body_Gyro_TimeX),
            SDBodyGyroTime_Yaxis = sd(SD_Body_Gyro_TimeY),
            SDBodyGyroTime_Zaxis = sd(SD_Body_Gyro_TimeZ),
            SDBodyGyroJerkTime_Xaxis = sd(SD_Body_Gyro_Jerk_TimeX),
            SDBodyGyroJerkTime_Yaxis = sd(SD_Body_Gyro_Jerk_TimeY),
            SDBodyGyroJerkTime_Zaxis = sd(SD_Body_Gyro_Jerk_TimeZ),
            SDBodyAccMagnitude_Time = sd(SD_Body_Acc_Magnitude),
            SDGravityAccMagnitude_Time = sd(SD_Gravity_Acc_Magnitude_Time),
            SDBodyAccJerkMagnitude_Time = sd(SD_Body_Acc_Jerk_Magnitude),
            SDBodyGyroMagnitude_Time = sd(SD_Body_Gyro_Magnitude),
            SDBodyGyroJerkMagnitude_Time = sd(SD_Body_Gyro_Jerk_Magnitude),
            SDFFTBodyAcc_Xaxis = sd(SD_FFT_Body_AccX),
            SDFFTBodyAcc_Yaxis = sd(SD_FFT_Body_AccY),
            SDFFTBodyAcc_Zaxis = sd(SD_FFT_Body_AccZ),
            SDFFTBodyAccJerk_Xaxis = sd(SD_FFT_Body_Acc_jerkX),
            SDFFTBodyAccJerk_Yaxis = sd(SD_FFT_Body_Acc_jerkY),
            SDFFTBodyAccJerk_Zaxis = sd(SD_FFT_Body_Acc_jerkZ),
            SDFFTBodyGyro_Xaxis = sd(SD_FFT_Body_GyroX),
            SDFFTBodyGyro_Yaxis = sd(SD_FFT_Body_GyroY),
            SDFFTBodyGyro_Zaxis = sd(SD_FFT_Body_GyroZ),
            SDFFTBodyAccMagnitude = sd(SD_FFT_Body_Acc_Magnitude),
            SDFFTBodyAccJerkMagnitude = sd(SD_FFT_Body_Acc_Jerk_Magnitude),
            SDFFTBodyGyroMagnitude = sd(SD_FFT_Body_Gyro_Magnitude),
            SDFFTBodyGyroJerkMagnitude = sd(SD_FFT_Body_Gyro_Jerk_Magnitude),
            SDFFTBodyGyroJerkMagnitude = sd(SD_FFT_Body_Gyro_Jerk_Magnitude))

write.table(Alldata_tidy, file='./CourseProject/Alldata_tidy.txt', sep='\t',row.names=FALSE)
