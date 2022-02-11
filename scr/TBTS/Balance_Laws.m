function [dx_dt] = Balance_Laws (~, x, Z, k, B) 
   L = Laplacian (k, B);
   [s, c] = size(Z);
   psi = ones(c,1);
   
   for j = 1:c
       for i = 1:s
           Z_ij = Z(i,j);
           if Z_ij >= 0 
               psi(j) = psi(j)*x(i)^Z_ij; 
           end
       end
   end
   
   dx_dt = - Z*L*psi;
end
