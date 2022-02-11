global Z B H y_1 t_1 k_0

t_span = t_1;

Lambda = y_1;

[N,s] = size(Lambda);

[n,~] = size(H);

[c,r] = size(B);
I_del = Deleted_Complexes (H, Z);

phi_k_0 =  Reduced_Parameters (k_0, B, I_del);
Z_red = Reduced_Complex_Composition(Z, I_del);
k = sym('k', [r 1]);
L = Laplacian(k,B);
L_red = Schur (k_0, B, I_del);
B_red = Reduced_Incidence (L_red);
p_hat = Step_1 (Lambda, t_span, Z_red, B_red)
k_hat = Step_2 (B, I_del, p_hat);
global T x_0
t_interval = 0:T/9000:T;
[t_2, x_2] = Concentrations (k_hat, Z, B, x_0, t_interval);
z = H*x_2;
x_0_red = x_0;
x_0_red(I_del) = [];
[t_3, x_3] = Concentrations (p_hat, Z_red, B_red, x_0_red, t_interval);

figure(1)
for i = 1:n
    subplot(3,3,i)
    y_i = Lambda(i,:);
    z_i = z(i,:);
    x_i = x_3(i,:);
    plot(t_span, y_i, 'x', 'color', 'r', 'linewidth', 1.5)
    hold on
    plot(t_interval, z_i, 'color', 'b', 'linewidth', 1.5)
    %hold on
    %plot(t_interval, x_i, 'color', 'r', 'linewidth', 1.5)
    grid on
    grid minor
    caption1 = sprintf('Experimental data');
    caption2 = sprintf('Predicted values');
    caption3 = sprintf('Reduced model');
    caption4 = sprintf('Species %d', i);
    legend(caption1, caption2) 
    xlabel({'Time (min)'}, 'fontweight','bold', 'Fontsize', 11)
    ylabel(caption4, 'fontweight','bold', 'Fontsize', 12)
end
