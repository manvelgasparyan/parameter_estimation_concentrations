function [k_hat] = Step_1 (Lambda, t_span, Z, B)
   error = @(k)Least_Squares_Error (k, Lambda, t_span, Z, B);
   [~,r] = size(B); 
   p_guess = 10800*ones(r,1);
   lb = zeros(r,1);
   ub = Inf*ones(r,1);
   k_hat = fmincon(error, p_guess, [], [], [], [], lb, ub);
end
