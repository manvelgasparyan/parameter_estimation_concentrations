function [error] = Dynamical_Difference (k, B, I_del)
    L = Laplacian (k, B);
    lambda = eig(L);
    lambda = real(lambda);
    lambda(lambda==0) = [];
    tau_L = min(lambda);
    L_red = Schur (k, B, I_del);
    mu = eig(L_red);
    mu = real(mu);
    mu(mu==0) = [];
    tau_L_red = min(mu);
    error = abs(tau_L - tau_L_red);
end
