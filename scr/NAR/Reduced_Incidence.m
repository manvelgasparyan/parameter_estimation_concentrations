function [B_red] = Reduced_Incidence (L_red)
    [~,c_red] = size(L_red);
    I = 1:c_red;
    B_red = [];

    for i = 1:c_red
        I_i = setdiff(I,i);
        N_i = numel(I_i);
        
        for j = 1:N_i
            m = I_i(j);
            
            if L_red(m,i) ~= 0
               B_i = zeros(c_red,1);
               B_i(i) = -1;
               B_i(m) = 1;
               B_red = [B_red B_i];
            end

         end     
    end
end
