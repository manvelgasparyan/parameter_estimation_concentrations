function [L_red] = Schur (k, B, I_del)
   L = Laplacian (k, B);
   c = size(L,1);
   I = 1:c;
   I_red = setdiff(I, I_del);
   L_11  = L(I_red, I_red);
   L_12 = L(I_red, I_del);
   L_22 = L(I_del,I_del);
   L_21 = L(I_del, I_red);
   L_red = L_11 - L_12*inv(L_22)*L_21;
end
