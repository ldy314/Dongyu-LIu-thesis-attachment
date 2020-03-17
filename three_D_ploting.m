%this function is for 3 D plotting and saving varible purpose
%Y is the m/z value.
%return the scan number axis, X;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for version 4.0
%for function test purpose only
%data_folder_name='C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data';
%where you keep the data

%output_foldername='C:\Users\dliu03\Google Drive\project\Research Project\MFRP_mars chamber\gas analyzer\ana data process matlab 4.0\example data\output';
%all results are storaged in this folder.
%run_title='test run of version 4.0_'
%[sorted_data_vector,sorted_data,MZ_label]=read_txt_data(data_folder_name);
%specific_mz_range_of_interest=[20,90];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%old function X=three_D_ploting(filename,run_title,sorted_data,MZ_label,run_title) 
%new one
function three_D_ploting(sorted_data,MZ_label,output_foldername,run_title,specific_mz_range_of_interest) 

% first is size of
sizeof_sorted_data=size(sorted_data);
%first creat X matrix
count=1;
one_for_make_X = ones(1,sizeof_sorted_data(2));
while count<=sizeof_sorted_data(1)
    X(count,:)=count*one_for_make_X;
    count=count+1;
end
%now is Y
count=1;

while count<=sizeof_sorted_data(1);
    Y(count,:)=MZ_label;
    count=count+1;
end
mesh(X,Y,sorted_data);
xlabel('scan number'),ylabel('m/z'),zlabel('intensity');
title_for_graph=strcat(run_title,'_',' total');
title(title_for_graph);
colorbar;
savefig_name=strcat(output_foldername,'\',' 3D plot.fig');
savefig(savefig_name);
set(gca, 'zscale', 'log');
colorbar;
name_for_three_D_semilog = strcat(output_foldername,'\',' semilog graph.fig');
savefig(name_for_three_D_semilog );

%I should make a special plot just to mointor the water peak, to make sure
%how long it takes for the water to drop
if sizeof_sorted_data(2)>220
mesh(X(:,100:220),Y(:,100:220),sorted_data(:,100:220));
xlabel('scan number'),ylabel('m/z'),zlabel('intensity');
title_for_graph=strcat(run_title,'_',' moniter water change');
title(title_for_graph);
colorbar;
savefig_name=strcat(output_foldername,'\',' 3D plot of water.fig');
savefig(savefig_name);
set(gca, 'zscale', 'log');
colorbar;
savefig_name=strcat(output_foldername,'\',' 3D log plot of water.fig');
savefig(savefig_name);
end
% add all the data over time to reduce the noise.

[reduced_matrix,noise_reduce_count]=noise_reduce_sum(sizeof_sorted_data,sorted_data);
semilogy(MZ_label,reduced_matrix);

xlabel('m/z'),ylabel('reduced noise intensity');

title((strcat(run_title,'_','semi log sum of all scans')));
savefig_name_for_reduced=strcat(output_foldername,'\',' semi log sum of all the scans.fig');
savefig(savefig_name_for_reduced); 

plot(MZ_label,reduced_matrix);
xlabel('m/z'),ylabel('reduced noise intensity');
title((strcat(run_title,'_',' sum of all scans')));
savefig_name_for_reduced=strcat(output_foldername,'\',' sum of all the scans.fig');
savefig(savefig_name_for_reduced); 

if sizeof_sorted_data(2)>1500
    if specific_mz_range_of_interest(1)~=0
        semilogy(MZ_label(specific_mz_range_of_interest(1)*10:(specific_mz_range_of_interest(2)*10)),reduced_matrix(specific_mz_range_of_interest(1)*10:(specific_mz_range_of_interest(2)*10)));
    else
        semilogy(MZ_label(1:(specific_mz_range_of_interest(2)*10)),reduced_matrix(1:(specific_mz_range_of_interest(2)*10)));
    end

xlabel('m/z'),ylabel('reduced noise intensity');
range_start=num2str(specific_mz_range_of_interest(1));
range_end=num2str(specific_mz_range_of_interest(2));

title(strcat(run_title,'_',range_start,'~',range_end));
name_for_specific_range_semilog = strcat(output_foldername,'\',range_start,'~',range_end,'.fig');

savefig(name_for_specific_range_semilog);

save(run_title,'sorted_data','MZ_label','reduced_matrix','noise_reduce_count');

%3D plot of specific range
mesh(X(:,(specific_mz_range_of_interest(1)*10):(specific_mz_range_of_interest(2)*10)),Y(:,(specific_mz_range_of_interest(1)*10):(specific_mz_range_of_interest(2)*10)),sorted_data(:,(specific_mz_range_of_interest(1)*10):(specific_mz_range_of_interest(2)*10)));
xlabel('scan number'),ylabel('m/z'),zlabel('intensity');
title_for_graph=strcat(run_title,'_','~~',range_start,'~',range_end);
title(title_for_graph);
colorbar;
savefig_name=strcat(output_foldername,'\~~',range_start,'~',range_end,' 3D plot of specific range.fig');
savefig(savefig_name); 
set(gca, 'zscale', 'log');
colorbar;
title_for_graph=strcat(run_title,'_','~~',range_start,'~',range_end,' semilog');
title(title_for_graph);

name_for_three_D_semilog = strcat(output_foldername,'\~~',range_start,'~',range_end,' semilog graph.fig');
savefig(name_for_three_D_semilog );


end

i=1;
