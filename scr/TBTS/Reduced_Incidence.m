function [B] = Reduced_Incidence (L)
    [~,c] = size(L);
    I = 1:c;
    B = [];
    
    for i = 1:c
        I_i = setdiff(I,i);
        N_i = numel(I_i);
        
        for j = 1:N_i
            m = I_i(j);
            
            if L(m,i) ~= 0
               B_i = zeros(c,1);
               B_i(i) = -1;
               B_i(m) = 1;
               B = [B B_i];
            end
        end     
    end
end
