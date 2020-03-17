% this function is here to check how some m/z value change with respect to
% time(scan number), plot them in a graph.

function plot_certain_mz(folder_name,combined_matrix,mz_value_of_interest,scan_number_axis,y_axis)
sizeof_value_of_interest=size(mz_value_of_interest);
size_of_y_axis=size(y_axis)
size_of_scan_number=size(scan_number_axis);
n=1;
%clf;
%figure(1);% this may help me draw muiltple plots in one.
save_m_z=zeros(sizeof_value_of_interest(2),size_of_scan_number(1));
while n<=sizeof_value_of_interest(2)
    %now use another varible to search with y_axis
    y_number=1;
    while y_number<=size_of_y_axis(2)
        if mz_value_of_interest(n)==y_axis(1,y_number)
           
            semilogy(scan_number_axis,combined_matrix(:,y_number));  
            save_m_z(n,:)=transpose(combined_matrix(:,y_number));
            %hold on;
            legend(num2str(mz_value_of_interest(n)));
            xlabel('m/z'),ylabel('intensity');
            title(strcat(folder_name,'m/z of interest',num2str(mz_value_of_interest(n))));
            %save the result;
            name_for_mz_graph=strcat(folder_name,'/ individual m to z change with time',num2str(mz_value_of_interest(n)),'.fig');
            savefig(name_for_mz_graph);
            break
        end
        y_number=y_number+1;
    end
    n=n+1;
end;
%save these m/z in one varible
variable_name=strcat(folder_name,'/m to z of interest.mat');
save(variable_name,'save_m_z');
i=1;



