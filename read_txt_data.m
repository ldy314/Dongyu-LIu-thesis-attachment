%%% 
%thanks to Stephen Cobeldick in matlabcentral for his help with txt file reading and filename converting functions


% for adjustment purpose
%pathname='C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data';

%%
function [sorted_data_vector,sorted_data,MZ_label]=read_txt_data(pathname)


data_name_list = dir(fullfile(pathname,'*.txt'));   %If I run f = fullfile('myfolder','mysubfolder','myfile.m')
                                                    %the result will be f =myfolder\mysubfolder\myfile.m
%Size_data_name_list = cell(size(data_name_list));this one is not necessary
%when I have numel(data_name_list)


% first convert the file names into something that can be understanded by
% the program
for k = 1:numel(data_name_list)% it is interesting to see how experts do this.elegent.
    data_name_list(k).name=strtok(data_name_list(k).name,'.');
    date_vector(k,:)=datevec(data_name_list(k).name,'mmm_dd_yyyy__HH-MM-SS_AM');
    
    % thanks to Stephen Cobeldick in matlabcentral for the function
    %two possible functions, datetime() and datenum(), the former one can
    %be easily analyzed by number , the second
    %one can give a vector in number. can get exact time in number
    
     %= data_name_list(k).name;
    %filepath = fullfile(pathname,filename);
    %... do whatever with each file
    %Size_data_name_list{k} = ... save any data
end

sorted_data_label(1,:)=data_name_list(1).name;
sorted_data_vector(1,:)=date_vector(1,:);


%now, sort the data files time
for k = 2:numel(data_name_list)% it is interesting to see how experts do this.elegent.
    time_count=1;
    while time_count<k
        % now sort the data label by year, month, day, hour, min and sec
        time_sort_count=1;
        while time_sort_count<7;% 6 is the number of time varibles in date_vector
            if date_vector(k,time_sort_count)>sorted_data_vector(time_count,time_sort_count)
                time_sort_count=7;
                break;
            elseif date_vector(k,time_sort_count)<sorted_data_vector(time_count,time_sort_count)
            break;
            end;
            time_sort_count=time_sort_count+1;
        end 
        if time_sort_count<7
            break;
        end
        time_count=time_count+1;
    end
    %= data_name_list(k).name;
    %filepath = fullfile(pathname,filename);
    %... do whatever with each file
    %Size_data_name_list{k} = ... save any data
    Move_count=k;
    
        while Move_count>time_count
            sorted_data_label(Move_count,:)=sorted_data_label(Move_count-1,:);
            sorted_data_vector(Move_count,:)=sorted_data_vector(Move_count-1,:);
            
            Move_count=Move_count-1;
            
        end
        
    sorted_data_label(Move_count,:)=data_name_list(k).name;
    sorted_data_vector(Move_count,:)=date_vector(k,:);
    
end

 

% now start to read from each text files.
for input_count=1:numel(data_name_list)
    
    temp_txt_read=txt2mat(strcat(pathname,'\',sorted_data_label(input_count,:),'.txt'));
    if input_count==1
        MZ_label=temp_txt_read(:,1);% MZ_label is the m/z label
    end
    sorted_data(input_count,:)=temp_txt_read(:,2);
end



i=1;