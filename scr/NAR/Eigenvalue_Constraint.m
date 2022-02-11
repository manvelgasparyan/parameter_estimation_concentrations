function [c, c_eq] = Eigenvalue_Constraint (k, B, I_del, p_hat)
    c = Reduced_Parameters (k, B, I_del) - p_hat;
    c_eq = [];
end
