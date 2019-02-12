clc;clear all;
format long;
addpath('F:\rsync\RESEARCHS\small_vocabulary_\megasync_003\matlab_htk-master');
kind_USER=9; % user sourceKIND


data_dir='F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8\';
mfcs=['rep_buf_Mon_Feb_04_21_52_08_2019';
'rep_buf_Mon_Feb_04_21_52_08_2019'    
];  %whos mfcs; 


data_dir='F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_mc_array_level_50_boost_0db\';
data_dir='F:\rsync\RESEARCHS\small_vocabulary_\datas\digit_rec_x240_v8_n01_level0\';

sx=dir(strcat(data_dir,'\*.lab'));
l_sx=length(sx);
mfcs=[];
for isx=1:l_sx
   mfcs=[mfcs ; strrep(sx(isx).name,'.lab','')]; 
end

data=[];
fnum=size(mfcs,1);

for i_fnum=1:fnum
    fname=strcat(data_dir,mfcs(i_fnum,:),'.mfc')
    [data_f,htkcode]=htkread(fname);
    data=[data ; data_f];
    dim_data=size(data)
    data_mean =mean(data);
    for iframe=1:dim_data(1,1) 
        zero_mean_data(iframe,:)=data(iframe,:)-data_mean;
    end
    cov_data=cov(zero_mean_data);
    eig_values=eig(cov_data);
end
plot(eig_values);

for i_fnum=1:fnum
    fname=strcat(data_dir,mfcs(i_fnum,:),'.mfc');
    data_f=[];
    [data_f,htkcode]=htkread(fname);whos data_f
    pcadata=[data_f(:,25:39)];
    fname_pca=strcat(data_dir,mfcs(i_fnum,:),'.pca');
    %htkwrite(pcadata,fname_pca,kind_USER);
end
% disp('completed');
