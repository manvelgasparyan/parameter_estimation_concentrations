function [y_hat] = Perturbation (Y_hat, sigma)
   moyenne = 0;
   [m,n] = size(Y_hat);
   matrix = rand(m,n);
   noise = moyenne + sigma*matrix;
   y_hat = Y_hat + noise;
end
