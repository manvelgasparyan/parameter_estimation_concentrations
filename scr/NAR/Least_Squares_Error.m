function [error] = Least_Squares_Error (k, Lambda, t_span, Z, B)
    z_0 = Lambda(:,1); 
    [~,z] = Concentrations (k, Z, B, z_0, t_span);
    [n,N] = size(z);
    
    error = 0;
    for i = 1:n
         for j = 1:N
             z_ij = (Lambda(i,j) - z(i,j))^2;
             error = error + z_ij;
         end
    end
    
    error = sqrt(error);
    error = error/(n*N);
end
