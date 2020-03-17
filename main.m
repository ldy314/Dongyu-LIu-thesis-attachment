%*************************************
%Dongyu Liu created on 2015.07.29
%dongyu.liu@tufts.edu
%liuzx314@gmail.com
% skype: dongyu.liu1
%always start from main fuction for the QMS analysis 
% the purpose for this program is to build a 3D plot
%data stop at 'end,1', 
%remember to insert start, 1 in the first row of the excel file, otherwise
%the raw and num will not have the same size
% example for the data file: Google Drive\project\K lab\MFRP & mars chamber\20150724\export from rga2_Jul_20_2015_11-24-52_AM\small data
% since the time it takes for one scan varies due to the change of scan
% range, I will simply put 1,2,3...on the time axis instead of the real
% time.
%
%in the future, I will add a varible to specify the period of one scan.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%*************************************
%this is the main function, first you need to input the names for all the
%execel files you want to process. then each one of them will be processed
%by 'single_excel_processing' separately.
%it will return the matrix for each one and save their individual graphs.
%use the strcat() function wisely

%do not forget to type in 'start,1' and 'end,1' in the begining and the ending of every excel file
%%%%%%%%%%%%%%%%%%%%%%%%
%first are the constants







%actually, one solution is that I can first cobine them all in a big txt file.
%after reading the file into matlab, then sort it out which one is first
%and which one is second.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if I read all the data into matlab first, there is no need to sort the
% txt files

%Change_Directories_NAME='cd C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data';
% remember to always add 'cd 'before filename, for example 'cd C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data'
% the directory name cannot contain special symbols like ?&$%#@ 
%status=dos(Change_Directories_NAME);

%dos('dir');% check whether the directory has been successfully changed
%command='for %%i in (*.txt) do type %%i>> for 20150803.txt"'
%status=dos(command);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% always remember to change the name of the file
%Input_datafile_name='C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data\combined data\test total.txt';
%Output_folder='C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data\output';
%formatSpec=(','); % the specing sign in data, this is usually the same
%A = mhdrload(Input_datafile_name);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for 4.0 version
%acknowledgement:
% Thanks to Stephen Cobeldick in matlabcentral for answering my questions about txt file reading and filename converting functions
%also thanks to the author of txt2mat.m, save me a lot of time to create a
%txt recognizing function. The license for this function is inclued in the
%folder txtread function\txt2mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%only need to change the constants in this section


data_folder_name='F:\g drive\project\Research Project\MFRP_mars chamber\20161013\UV\raw data';
%where you keep the data

output_foldername='F:\g drive\project\Research Project\MFRP_mars chamber\20161013\UV';
%all results are storaged in this folder.

%this is the title for this data analysis
run_title=' 20161013 0.5gNaClO2, 0.5g TiO2, 9.5g sand, QMS as pump flow through, UV, 48h, 1 sccm';

%if you are interested in analyzing a specific range of scan, just enter
%the start point and end point below
specific_mz_range_of_interest=[1,5];
%for example, specific_mz_range_of_interest=[1,90] means that the graph
%will show from m/z=1 to m/z=90

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




[sorted_data_vector,sorted_data,MZ_label]=read_txt_data(data_folder_name);
%this function is created to read and sort out data from txt files
%directly.

%save varibles
Save_Varibles_name=strcat(output_foldername,'\','_',run_title,'.mat');
save(Save_Varibles_name,'run_title','sorted_data_vector','sorted_data','MZ_label','specific_mz_range_of_interest','data_folder_name','output_foldername');
% sorted_data_vector is a time stamp for each scan


%now process this combined matrix

three_D_ploting(sorted_data,MZ_label,output_foldername,run_title,specific_mz_range_of_interest) ;

%save combined data is done in three-D-ploting, which is the combined_matrix
%varible. x axis is scan number, y axis is the m/z ratio



i=1















