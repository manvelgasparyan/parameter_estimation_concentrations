function [error] = Dynamical_Difference (k, B, I_del)
    L = Laplacian (k, B);
    sigma_L = eig(L);
    sigma_L = real(sigma_L);
    c = numel(sigma_L);
    
    zero = [];
    for i = 1:c
        if sigma_L(i) == 0
           zero = [zero, i];
        end
    end
    
    sigma_L(zero) = [];
    
    tau_L = min(sigma_L);
    
    L_red = Schur (k, B, I_del);
    
    sigma_L_red = eig(L_red);
    
    sigma_L_red = real(sigma_L_red);
    
    c_red = numel(sigma_L_red);
    
    zero = [];
    for i = 1:c_red
        if sigma_L_red(i) == 0
            zero = [zero, i];
        end
    end
    
    sigma_L_red(zero) = [];
    
    tau_L_red = min(sigma_L_red);
    error = abs(tau_L -tau_L_red);
end
