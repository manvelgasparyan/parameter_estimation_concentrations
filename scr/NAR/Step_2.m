function [k_hat] = Step_2 (B, I_del, p_hat) 
   error = @(k)Dynamical_Difference (k, B, I_del);
   my_constraint = @(k)Eigenvalue_Constraint (k, B, I_del, p_hat);
   [~,r] = size(B); 
   k_guess = 30000*ones(r,1);
   lb = zeros(r,1);
   ub = Inf*ones(r,1);
   k_hat = fmincon(error, k_guess, [], [], [], [], lb, ub, my_constraint);
end
