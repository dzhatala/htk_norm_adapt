clc;
addpath('F:\rsync\RESEARCHS\small_vocabulary_\megasync_003\matlab_htk-master');
kind_USER=9;
[data,htkcode]=htkread('F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8\rep_buf_Mon_Feb_04_21_52_08_2019.mfc');
htkwrite(data,'F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8\rep_buf_Mon_Feb_04_21_52_08_2019.pca',kind_USER);
[data,htkcode]=htkread('F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8\rep_buf_Tue_Feb_05_14_05_38_2019.mfc');
htkwrite(data,'F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8\rep_buf_Tue_Feb_05_14_05_38_2019.pca',kind_USER);
