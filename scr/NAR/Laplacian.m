function [L] = Laplacian (k, B)
   Delta = min(B,0);
   Gamma_k = diag(k);
   L = B*Gamma_k*Delta';
end
