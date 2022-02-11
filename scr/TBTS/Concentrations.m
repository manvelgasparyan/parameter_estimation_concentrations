function [t, x] = Concentrations (k, Z, B, x_0, t_span)  
    f = @(tau,y)Balance_Laws (tau, y, Z, k, B);
    options = odeset('RelTol',1e-8,'AbsTol',1e-10);
    [~,x] = ode23tb (f, t_span, x_0, options);
    x = x';
    t = t_span;
end
