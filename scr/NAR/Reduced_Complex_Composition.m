function [Z_red] = Reduced_Complex_Composition(Z, I_del)
    Z_red = Z;
    Z_red(:,I_del) = [];
    [s_red,~] = size(Z_red);
    
    for i = 1:s_red
        Z_red_i(i) = sum(Z_red(i,:));
    end
    
    Zero_species = [];
    
    for j = 1:s_red
        if Z_red_i(j) ==0
            Zero_species = [Zero_species, j];
        end
    end
    
    Z_red(Zero_species,:) = [];
end
