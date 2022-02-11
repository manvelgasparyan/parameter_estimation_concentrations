function [I_del] = Deleted_Complexes (H, Z) 
    [~,s] = size(H);
    [~,c] = size(Z);
    Species = 1:s;
    H_sum = zeros(s,1);
    
    for i = 1:s
        H_i = H(:,i);
        H_sum(i) = sum(H_i);
    end
    
    Measured_Species = find(H_sum ~= 0);
    Unmeasured_Species = setdiff(Species, Measured_Species);
    m = numel(Unmeasured_Species);
    
    I_del = [];
    
    for i = 1:c
        for j = 1:m
            n = Unmeasured_Species(j);
            Z_ni = 0;
            Z_ni = Z_ni + Z(n,i);
            
            if Z_ni ~= 0
                I_del = [I_del i];
            end
        end   
    end
end
