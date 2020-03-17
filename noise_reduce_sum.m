function [reduced_matrix,noise_reduce_count]=noise_reduce_sum(sizeof_final_matrix,final_matrix)


noise_reduce_count=1;
while noise_reduce_count<=sizeof_final_matrix(2)
    reduced_matrix(noise_reduce_count)=sum(final_matrix(:,noise_reduce_count));
    noise_reduce_count=noise_reduce_count+1;
end
reduced_matrix=reduced_matrix/(sizeof_final_matrix(1));

