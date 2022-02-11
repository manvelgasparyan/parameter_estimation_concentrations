function [phi_k] = Reduced_Parameters (k, B, I_del)
    L_red = Schur (k, B, I_del);
    [c_red,~] = size(L_red);
    d = diag(L_red);
    D = diag(d);
    A = D - L_red;
    phi_k = [];
    
    for i = 1:c_red
        L_i = A(:,i);
        phi_k = [phi_k; L_i];
    end
    
    J = [];
    for i = 1:c_red^2
        if phi_k(i) == 0
            J = [J, i];
        end
    end

    phi_k(J) = [];
end
