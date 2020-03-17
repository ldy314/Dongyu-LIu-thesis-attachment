%this function is used to combine all the separate function and make it a
%big one.
function [combined_matrix]=combine_matrix(total_matrix)
sizeof_total_matrix=size(total_matrix);
combine_count=1;
while combine_count<=sizeof_total_matrix(2)
    if combine_count==1
        combined_matrix=total_matrix{combine_count};
    else
        combined_matrix=[combined_matrix;total_matrix{combine_count}];
    end
    combine_count=combine_count+1;
end
